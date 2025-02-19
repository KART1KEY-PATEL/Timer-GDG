import 'package:flutter/material.dart';
import 'package:timer/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TimerHomePage(),
    );
  }
}

class TimerHomePage extends StatefulWidget {
  const TimerHomePage({super.key});

  @override
  State<TimerHomePage> createState() => _TimerHomePageState();
}

class _TimerHomePageState extends State<TimerHomePage> {
  Duration _timeRemaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    // Set hackathon end time to 20/02/2025 13:00
    DateTime hackEndTime = DateTime(2025, 2, 20, 13, 0, 0);
    _timeRemaining = hackEndTime.difference(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    var sW = MediaQuery.of(context).size.width;
    var sH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.asset(
              "assets/logo.png",
              height: sH * 0.15,
            ),
            SizedBox(
              height: sH * 0.02,
            ),
            Center(
              child: FlipClockPlus.reverseCountdown(
                separator: SizedBox(width: sW * 0.01),
                duration: Duration(
                  hours: _timeRemaining.inHours,
                  minutes: _timeRemaining.inMinutes.remainder(60),
                  seconds: _timeRemaining.inSeconds.remainder(60),
                ),
                digitColor: Colors.black,
                backgroundColor: Colors.white,
                digitSize: sW * 0.2,
                height: sH * 0.6,
                spacing: EdgeInsets.all(2),
                width: sW * 0.15,
                borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                onDone: () {
                  print("Hackathon is over!");
                },
              ),
            ),
            SizedBox(
              height: sH * 0.02,
            ),
            Text(
              "FlutterFrames",
              style: TextStyle(
                fontSize: 72,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
