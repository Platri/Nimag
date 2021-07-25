part of 'timer_bloc.dart';

enum StatusOfTimer { initial, running, complete, error }
enum StatusOfNimagTimer { initial, running, complete, error }

class TimerState extends Equatable {
  const TimerState({
    this.remainingTimerTime = '00:00:00',
    this.status = StatusOfTimer.initial,
    this.startTime = null,
     this.nimagCount = 0,
     this.remainingNimagTime = '00:00:00',
  });
  final String remainingTimerTime;
  final StatusOfTimer status;
  final DateTime? startTime;
  final int nimagCount;
  final String remainingNimagTime;

  @override
  List<Object?> get props {
    return [
      remainingTimerTime,
      status,
      startTime,
      nimagCount,
      remainingNimagTime,
    ];
  }

  TimerState copyWith({
    String? remainingTimerTime,
    StatusOfTimer? status,
    DateTime? startTime,
    int? nimagCount,
    String? remainingNimagTime,
  }) {
    return TimerState(
      remainingTimerTime: remainingTimerTime ?? this.remainingTimerTime,
      status: status ?? this.status,
      startTime: startTime ?? this.startTime,
      nimagCount: nimagCount ?? this.nimagCount,
      remainingNimagTime: remainingNimagTime ?? this.remainingNimagTime,
    );
  }
}
