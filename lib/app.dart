import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimag/services/database_service.dart';
import 'package:nimag/services/ticker.dart';
import 'package:nimag/services/timer_bloc/timer_bloc.dart';
import 'package:nimag/view/home_screen.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
    required this.dbService,
  }) : super(key: key);
  @override
  _AppState createState() => _AppState();

  final DBService dbService;
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TimerBloc(dbService: widget.dbService, ticker: Ticker()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            accentColor: Color(0xff53d2dc),
            textTheme: TextTheme(
              bodyText1: TextStyle(),
              bodyText2: TextStyle(),
            ).apply(
                bodyColor: Color(0xff26648E), displayColor: Color(0xff26648E))),
        title: 'Nimag',
        home: HomePage(),
      ),
    );
  }
}
