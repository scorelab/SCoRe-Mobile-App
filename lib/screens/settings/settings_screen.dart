import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:score_app/states/config_state.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConfigState configState = Provider.of<ConfigState>(context);
    return Container(
      child: Column(
        children: <Widget>[
          configState.darkTheme
              ? ListTile(
                  leading: Icon(FontAwesomeIcons.lightbulb),
                  title: Text("Turn off dark mode"),
                  onTap: () {
                    configState.toggleDarkTheme();
                  },
                )
              : ListTile(
                  leading: Icon(FontAwesomeIcons.solidLightbulb),
                  title: Text("Turn on dark mode"),
                  onTap: () {
                    configState.toggleDarkTheme();
                  },
                ),
        ],
      ),
    );
  }
}
