import 'dart:async';

import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late Timer _timer;

  Duration duration = Duration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _buildTimer(),
          _startButton(),
        ],
      )),
    );
  }

  _startButton() {
    return ElevatedButton(onPressed: () => startTimer(), child: Text("Start"));
  }

  _buildTimer() {
    String twoDigits(int num) => num.toString().padLeft(2, "0");
    final String hrs = twoDigits(duration.inHours.remainder(60));
    final mins = twoDigits(duration.inMinutes.remainder(60));
    final sec = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '${hrs} : ${mins} : ${sec}',
      style: TextStyle(fontSize: 32),
    );
  }

  startTimer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) => addTime());
  }

  addTime() {
    setState(() {
      final second = duration.inSeconds + 1;
      duration = Duration(seconds: second);
    });
  }
}
