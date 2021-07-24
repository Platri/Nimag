part of 'nimag_bloc.dart';

@immutable
abstract class NimagEvent extends Equatable {
  const NimagEvent();

  @override
  List<Object> get props => [];
}

class ChangeSelectedPageEvent extends NimagEvent {
  const ChangeSelectedPageEvent({required this.selectedPage});

  final int selectedPage;
  @override
  List<Object> get props => [selectedPage];
}

class GetPageEvent extends NimagEvent {}

class StartNimagTimeEvent extends NimagEvent {
  const StartNimagTimeEvent({required this.nimagTime});

  final DateTime nimagTime;
  @override
  List<Object> get props => [nimagTime];
}

class GetNimagTimeEvent extends NimagEvent {}

class UpdateNimagCountEvent extends NimagEvent {
  const UpdateNimagCountEvent({required this.nimagAvailability});

  final bool nimagAvailability;
  @override
  List<Object> get props => [nimagAvailability];
}

class GetNimagCountEvent extends NimagEvent {}

class IsEverythingDoneEvent extends NimagEvent {}
