import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_app/screens/splash/splash_screen.dart';
import 'package:score_app/states/config_state.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ConfigState>.value(
          value: ConfigState(),
        ),
      ],
      child: ScoreApp(),
    ),
  );
}

class ScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConfigState configState = Provider.of<ConfigState>(context);
    return MaterialApp(
      title: 'Score Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: configState.darkTheme ? Brightness.dark : Brightness.light,
      ),
      home: SplashScreen(),
    );
  }
}
