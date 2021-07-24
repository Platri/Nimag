import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimag/services/bloc/nimag_bloc.dart';

class NimagNavigator extends StatefulWidget {
  @override
  _NimagNavigatorState createState() => _NimagNavigatorState();
}

class _NimagNavigatorState extends State<NimagNavigator> {
  static List<Widget> _widgetOptions = <Widget>[
    StartPage(),
    TimerPage(),
    WaitingPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNecessities();
  }

  Future? getNecessities() {
    BlocProvider.of<NimagBloc>(context).add(GetPageEvent());
    BlocProvider.of<NimagBloc>(context).add(GetNimagTimeEvent());
    BlocProvider.of<NimagBloc>(context).add(GetNimagCountEvent());
    BlocProvider.of<NimagBloc>(context).add(IsEverythingDoneEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NimagBloc, NimagState>(
      builder: (context, state) {
        if (state.isDone == true) {
          return Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(state.selectedPage!),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                    child: Text(
                  '1 Nimag verfügbar',
                  style: TextStyle(),
                )),
              ),
              Expanded(
                flex: 2,
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Nimag Starten'),
                )),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Center(
                      child: Text(
                          '1 Nimag dauert 24 Stunden an. Nach Aktivierung des Nimags dauert es 30 Tage bis der nächste nimag freigeschaltet wird.')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WaitingPage extends StatefulWidget {
  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
