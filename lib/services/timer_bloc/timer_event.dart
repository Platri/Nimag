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
  });
  final DateTime startTime;
  @override
  List<Object> get props => [startTime];
}

class TimerResumed extends TimerEvent {}

class TimerTicked extends TimerEvent {
  final int duration;

  const TimerTicked({required this.duration});

  @override
  List<Object> get props => [duration];
}

class NimagTicked extends TimerEvent {}