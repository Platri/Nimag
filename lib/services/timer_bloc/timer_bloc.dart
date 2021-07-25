import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:nimag/services/database_service.dart';
import 'package:nimag/services/ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc({required Ticker ticker, required this.dbService})
      : _ticker = ticker,
        super(TimerState());
  final Ticker _ticker;
  final DBService dbService;

  StreamSubscription<int>? _timerTickerSubscription;
  StreamSubscription<int>? _nimagCountSubscription;

  @override
  void onTransition(Transition<TimerEvent, TimerState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is TimerStarted) {
      yield* _mapTimerStartedToState(event);
    } else if (event is TimerResumed) {
    } else if (event is TimerTicked) {
      yield* _mapTimerTickedToState(event);
    } else if (event is NimagTicked) {
      yield* _mapNimagTickedToState(event);
    } else if (event is AppInitialized) {
      yield* _mapAppInitializedToState(event);
    }
  }

  @override
  Future<void> close() {
    _timerTickerSubscription?.cancel();
    _nimagCountSubscription?.cancel();
    return super.close();
  }

  Stream<TimerState> _mapAppInitializedToState(AppInitialized event) async* {
    int? nimagCount;
    DateTime? nimagStartTime;
    DateTime? timerStartTime;
    try {
      nimagCount = await dbService.getNimagCount() ?? 1;
      nimagStartTime = await dbService.getNimagStartTime();
      timerStartTime = await dbService.getTimerStartTime();

      print('nimag count: $nimagCount');
      print('nimag start time $nimagStartTime ');
      print('timer start time $timerStartTime ');

      if (nimagStartTime == null) {
        await dbService.putNimagStartTime(DateTime.now()
            .subtract(Duration(days: 29, hours: 23, minutes: 59)));
        nimagStartTime = DateTime.now();
      }
      if (timerStartTime == null) {
        yield state.copyWith(
          status: StatusOfTimer.initial,
          nimagCount: nimagCount,
          remainingNimagTime: _nimagTimeLeft(nimagStartTime),
        );
      } else {
        add(TimerStarted(startTime: timerStartTime));
      }
      this._nimagCountSubscription =
          _ticker.nimagCountTick(ticks: 60).listen((event) {
        add(NimagTicked());
      });
    } catch (e) {
      throw e;
    }
  }

  Stream<TimerState> _mapNimagTickedToState(NimagTicked event) async* {
    DateTime? startTime = await dbService.getNimagStartTime();
    print('ticked nimag start time: $startTime');
    if (startTime != null) {
      if (startTime
          .add(Duration(days: 30))
          .difference(DateTime.now())
          .isNegative) {
        print('inside negetive');
        await dbService.putNimagCount(state.nimagCount + 1);
        await dbService.putNimagStartTime(DateTime.now()
            .subtract(Duration(days: 29, hours: 23, minutes: 59)));
        yield state.copyWith(
          nimagCount: state.nimagCount + 1,
        );
        return;
      }
      yield state.copyWith(remainingNimagTime: _nimagTimeLeft(startTime));
    }
  }

  Stream<TimerState> _mapTimerStartedToState(TimerStarted event) async* {
    if (state.nimagCount > 0) {
      try {
        await dbService.putTimerStartTime(event.startTime.subtract(Duration(hours: 23, minutes: 59, seconds: 30)));
      } catch (e) {
        yield state.copyWith(
          status: StatusOfTimer.error,
        );
        throw e;
      }
      yield state.copyWith(
          startTime: event.startTime.subtract(Duration(hours: 23, minutes: 59, seconds: 30)),
          status: StatusOfTimer.running,
          remainingTimerTime: _timerTimeLeft(
              event.startTime.subtract(Duration(hours: 23, minutes: 59))));
      _timerTickerSubscription?.cancel();
      _timerTickerSubscription = _ticker
          .timerTick(ticks: 60)
          .listen((event) => add(TimerTicked(duration: event)));
    }
  }

  Stream<TimerState> _mapTimerTickedToState(TimerTicked event) async* {
    DateTime? startTime = state.startTime;
    print(startTime);

    if (startTime != null) {
      if (startTime
          .add(Duration(hours: 24))
          .difference(DateTime.now())
          .isNegative) {
        await _timerTickerSubscription?.cancel();
        await dbService.putNimagCount(state.nimagCount - 1);
        yield state.copyWith(
            remainingTimerTime: 'timer ended',
            status: StatusOfTimer.initial,
            nimagCount: state.nimagCount - 1);
        return;
      }
      yield state.copyWith(remainingTimerTime: _timerTimeLeft(startTime));
    }
  }

  String _timerTimeLeft(DateTime startedAt) {
    late String retVal;

    DateTime _finishTime = startedAt.add(Duration(hours: 24));
    Duration _timeLeft = _finishTime.difference(DateTime.now());
    int _hoursUntilFinish = _timeLeft.inHours;
    int _minsUntilFinish = _timeLeft.inMinutes - (_hoursUntilFinish * 60);
    int _secondsUntilFinish = _timeLeft.inSeconds -
        (_hoursUntilFinish * 60 * 60) -
        (_minsUntilFinish * 60);

    retVal = NumberFormat('00').format(_hoursUntilFinish).toString() +
        ':' +
        NumberFormat('00').format(_minsUntilFinish).toString() +
        ':' +
        NumberFormat('00').format(_secondsUntilFinish).toString();

    return retVal;
  }

  String _nimagTimeLeft(DateTime startedAt) {
    late String retVal;
    DateTime _finishTime = startedAt.add(Duration(days: 30));
    Duration _timeLeft = _finishTime.difference(DateTime.now());
    int _daysUntilFinish = _timeLeft.inDays;
    int _hoursUntilFinish = _timeLeft.inHours - (_daysUntilFinish * 24);
    int _minsUntilFinish = _timeLeft.inMinutes -
        (_daysUntilFinish * 24 * 60) -
        (_hoursUntilFinish * 60);
    int _secondsUntilFinish = _timeLeft.inSeconds -
        (_daysUntilFinish * 24 * 60 * 60) -
        (_hoursUntilFinish * 60 * 60) -
        (_minsUntilFinish * 60);

    retVal = NumberFormat('00').format(_daysUntilFinish).toString() +
        ' Tage, ' +
        NumberFormat('00').format(_hoursUntilFinish).toString() +
        ' Stunden, ' +
        NumberFormat('00').format(_minsUntilFinish).toString() +
        ' Minuten, ' +
        NumberFormat('00').format(_secondsUntilFinish).toString() +
        ' Sekunden, ';

    return retVal;
  }
}
