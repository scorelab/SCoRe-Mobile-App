import 'package:flutter/material.dart';
import 'package:score_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            stops: [0.1, 0.5, 0.7, 0.95],
            colors: [
              Colors.white,
              Colors.white70,
              Colors.white54,
              Colors.white10,
            ],
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/score.png'),
        ),
      ),
    );
  }
}
