import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimag/services/timer_bloc/timer_bloc.dart';
import 'package:nimag/view/nimag_count_column.dart';
import 'package:nimag/view/timer_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TimerBloc>(context).add(AppInitialized());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffFFE3B3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: size.width,
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    minRadius: size.width * .25,
                    maxRadius: size.width * .3,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/nimag_logo_new.png',
                        errorBuilder: (context, error, stackTrace) {
                          return Container(child: Icon(Icons.timer));
                        },
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 20,
                  ),
                  Text(
                    'Nichts machen und auch noch genießen Tag',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width: size.width,
                      height: 50,
                    ),
                  if (state.status == StatusOfTimer.initial) ...[
                    Expanded(child: NimagCountColumn()),
                    Spacer(
                      flex: 1,
                    ),
                    StartTimerButton(
                      
                      onPressed: () {
                        BlocProvider.of<TimerBloc>(context)
                            .add(TimerStarted(startTime: DateTime.now(), fromPrev: false));
                      },
                    ),
                  ],
                  if (state.status == StatusOfTimer.running) ...[
                    SizedBox(
                      width: size.width,
                      height: 20,
                    ),
                    Expanded(child: TimerColumn()),
                   
                  ],
                  if (state.status == StatusOfTimer.error)
                    Center(child: Text('error')),
                   SizedBox(
                      width: size.width,
                      height: 50,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class StartTimerButton extends StatelessWidget {
  const StartTimerButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .08,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text('Nimag Starten', style: TextStyle(fontSize: 25, color: Color(0xffFFE3B3),)),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>( Color(0xff26648E)))),
    );
  }
}
