import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimag/services/timer_bloc/timer_bloc.dart';

class TimerColumn extends StatelessWidget {
  const TimerColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text('Der Nimag läuft noch: '),
        BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            return TimerText(
              timerText: state.remainingTimerTime,
            );
          },
        ),
        SizedBox(
          width: size.width,
          height: 20,
        ),
        Expanded(
            child: Text(
          'Wenn jemand Ihnen diesen Bildschirm zeigt, bedeutet dies, dass diese Person sich aktuell in einer insgesamt 24 Stunden langen Nimag-Phase befindet. Bitte respektieren Sie die Nimagphase und lassen Sie die Person bis Ablauf des Countdowns in Ruhe!',
          textAlign: TextAlign.center,
        ))
      ],
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key, required this.timerText}) : super(key: key);

  final String timerText;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$timerText',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 50),
    );
  }
}
