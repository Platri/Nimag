import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimag/services/timer_bloc/timer_bloc.dart';

class NimagCountColumn extends StatelessWidget {
  const NimagCountColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Column(
          children: [
            NimagCountText(count: state.nimagCount),
            NimagInfo(),
            NimagTimeLeft(
              nimagTime: state.remainingNimagTime,
            ),
          ],
        );
      },
    );
  }
}

class NimagCountText extends StatelessWidget {
  const NimagCountText({required this.count, Key? key}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Nimag-Count: $count',
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }
}

class NimagInfo extends StatelessWidget {
  const NimagInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '1 Nimag daurte 24 Stunden an. Alle 30 Tage erhältst do einen weiteren Nimag. Wartezeit, bis weiterer Nimag bereitsteht',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class NimagTimeLeft extends StatelessWidget {
  const NimagTimeLeft({Key? key, required this.nimagTime}) : super(key: key);

  final String nimagTime;

  @override
  Widget build(BuildContext context) {
    return Text(nimagTime, style: TextStyle(fontWeight: FontWeight.bold),);
  }
}
