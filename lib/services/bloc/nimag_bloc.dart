// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'package:nimag/services/database_service.dart';
// part 'nimag_event.dart';
// part 'nimag_state.dart';

// class NimagBloc extends Bloc<NimagEvent, NimagState> {
//   NimagBloc() : super(NimagInitial());

//   DBService localStorage = DBService();
//   @override
//   Stream<NimagState> mapEventToState(
//     NimagEvent event,
//   ) async* {
//     if (event is ChangeSelectedPageEvent) {
//       yield* _mapChangeSelectedPageState(event, state);
//     } else if (event is UpdateNimagCountEvent) {
//       yield* _mapPutNimagCountState(event, state);
//     } else if (event is StartNimagTimeEvent) {
//       yield* _mapPutNimagTimeState(event, state);
//     } else if (event is GetPageEvent) {
//       yield* _mapGetPageState(event, state);
//     } else if (event is GetNimagCountEvent) {
//       yield* _mapGetNimagCountState(event, state);
//     } else if (event is GetNimagTimeEvent) {
//       yield* _mapGetNimagTimeState(event, state);
//     } else if (event is IsEverythingDoneEvent) {
//       yield* _mapIsEverythingDoneState(event, state);
//     }
//   }

//   Stream<NimagState> _mapChangeSelectedPageState(
//       ChangeSelectedPageEvent event, NimagState state) async* {
//     try {
//       print('Changing Screen');
//       await localStorage.putScreen(event.selectedPage);
//       yield state.copyWith(selectedPage: event.selectedPage);
//     } catch (e) {
//       print(e);
//       return;
//     }
//   }

//   Stream<NimagState> _mapPutNimagCountState(
//       UpdateNimagCountEvent event, NimagState state) async* {
//     try {
//       print('Putting Nimag Count');
//       //  await localStorage.putkNimagCount(event.nimagAvailability);
//       //  yield state.copyWith(nimagAvailable: event.nimagAvailability);
//     } catch (e) {
//       print(e);
//       return;
//     }
//   }

//   Stream<NimagState> _mapPutNimagTimeState(
//       StartNimagTimeEvent event, NimagState state) async* {
//     try {
//       print('Putting Nimag Time ');
//       await localStorage.putNimagTime(event.nimagTime);
//       yield state.copyWith(lastNimag: event.nimagTime);
//     } catch (e) {
//       print(e);
//       return;
//     }
//   }

//   Stream<NimagState> _mapGetPageState(
//       GetPageEvent event, NimagState state) async* {
//     try {
//       print('Getting Screen');
//       int? selectedPage = await localStorage.getScreen();
//       yield state.copyWith(selectedPage: selectedPage);
//     } catch (e) {
//       print(e);
//       return;
//     }
//   }

//   Stream<NimagState> _mapGetNimagCountState(
//       GetNimagCountEvent event, NimagState state) async* {
//     try {
//       print('Getting Nimag Count');
//       String? nimagCount = await localStorage.getNimagCount();
//       yield state.copyWith(nimagCount: nimagCount);
//     } catch (e) {
//       print(e);
//       return;
//     }
//   }

//   Stream<NimagState> _mapGetNimagTimeState(
//       GetNimagTimeEvent event, NimagState state) async* {
//     try {
//       print('Getting Time');
//       DateTime? lastNimag = await localStorage.getNimagTime();
//       if (lastNimag == null) {
//       } else {
//         yield state.copyWith(lastNimag: lastNimag);
//       }
//     } catch (e) {
//       print(e);
//       return;
//     }
//   }

//   Stream<NimagState> _mapIsEverythingDoneState(
//       IsEverythingDoneEvent event, NimagState state) async* {
//     yield state.copyWith(isDone: true);
//   }
// }
