import 'package:flutter/material.dart';
import 'package:pertemuan3/login_screen.dart';
import 'package:pertemuan3/stopwatch.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}