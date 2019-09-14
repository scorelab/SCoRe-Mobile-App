import 'package:flutter/material.dart';
import 'package:score_app/screens/splash_screen.dart';

void main() => runApp(ScoreApp());

class ScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Score Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      home: SplashScreen(),
    );
  }
}
