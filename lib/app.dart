import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimag/services/bloc/nimag_bloc.dart';
import 'package:nimag/view/homePage.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NimagBloc>(
      create: (context) => NimagBloc(),
      child: BlocBuilder<NimagBloc, NimagState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Nimag',
            home: NimagNavigator(),
          );
        },
      ),
    );
  }
}
