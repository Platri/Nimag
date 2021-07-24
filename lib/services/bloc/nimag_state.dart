part of 'nimag_bloc.dart';

@immutable
class NimagState extends Equatable {
  const NimagState(
      {this.isDone = false,
      this.selectedPage,
      this.nimagCount,
      this.lastNimag});
  final int? selectedPage;
  final String? nimagCount;
  final DateTime? lastNimag;
  final bool? isDone;

  NimagState copyWith(
      {bool? isDone,
      int? selectedPage,
      String? nimagCount,
      DateTime? lastNimag}) {
    return NimagState(
      isDone: isDone ?? this.isDone,
      selectedPage: selectedPage ?? this.selectedPage,
      nimagCount: nimagCount ?? this.nimagCount,
      lastNimag: lastNimag ?? this.lastNimag,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isDone, selectedPage, nimagCount, lastNimag];
}

class NimagInitial extends NimagState {}
