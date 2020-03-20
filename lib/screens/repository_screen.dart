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
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Divider(),
                SizedBox(height: 16),
                Text("OWNER", style: TextStyle(fontSize: 16)),
                ListTile(
                  title: Text(result["owner"]["login"]),
                  leading: ClipOval(
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: result['owner']["avatar_url"]),
                  ),
                ),
                Divider(),
                SizedBox(height: 16),
                Text("CONTRIBUTORS", style: TextStyle(fontSize: 16)),
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Wrap(
                          direction: Axis.horizontal,
                          children: json
                              .decode(snapshot.data.body)
                              .map<Widget>(
                                (contributor) => Container(
                                  margin: EdgeInsets.all(5),
                                  child: Tooltip(message: contributor["login"],child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: contributor["avatar_url"],
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),),
                                ),
                              )
                              .toList(),
                        );
                      } else {
                        return Container();
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Wrap(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(5),
                            child: ClipOval(
                              child: Container(
                                width: 50,
                                height: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: ClipOval(
                              child: Container(
                                width: 50,
                                height: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: ClipOval(
                              child: Container(
                                width: 50,
                                height: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                  future: get(result["contributors_url"]),
                ),
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
