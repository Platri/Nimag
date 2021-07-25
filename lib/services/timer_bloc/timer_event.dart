part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class AppInitialized extends TimerEvent {}

class TimerStarted extends TimerEvent {
  TimerStarted({
    required this.startTime,
    required this.fromPrev,
  });
  final DateTime startTime;
  final bool fromPrev;
  @override
  List<Object> get props => [startTime, fromPrev];
}

class TimerResumed extends TimerEvent {}

class TimerTicked extends TimerEvent {}

class NimagTicked extends TimerEvent {}
