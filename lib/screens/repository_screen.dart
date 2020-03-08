import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:score_app/widgets/tag_custom_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryScreen extends StatefulWidget {
  final dynamic repository;
  RepositoryScreen({@required this.repository});
  @override
  _RepositoryScreenState createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.repository["name"]),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        if (!snapshot.hasData)
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.repository["name"]),
            ),
            body: Text("Something went wrong!"),
          );
        var result = json.decode(snapshot.data.body);
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.repository["name"]),
            actions: <Widget>[
              IconButton(
                  icon: Icon(FontAwesomeIcons.githubAlt),
                  onPressed: () {
                    _launchGithub(result["html_url"]);
                  })
            ],
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Spacer(),
                    TagWidget(
                        icon: FontAwesomeIcons.eye,
                        title: "Watch",
                        count: result["subscribers_count"]),
                    Spacer(),
                    TagWidget(
                        icon: FontAwesomeIcons.solidStar,
                        title: "Star",
                        count: result["stargazers_count"]),
                    Spacer(),
                    TagWidget(
                        icon: FontAwesomeIcons.codeBranch,
                        title: "Frok",
                        count: result["forks"]),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 16),
                Text(result['description']),
              ],
            ),
          ),
        );
      },
      future: get(widget.repository["url"]),
    );
  }

  void _launchGithub(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
