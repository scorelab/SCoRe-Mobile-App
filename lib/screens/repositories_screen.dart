import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:score_app/screens/repository_screen.dart';
import 'package:score_app/utils/score.dart';

class RepositoriesScreen extends StatefulWidget {
  @override
  _RepositoriesScreenState createState() => _RepositoriesScreenState();
}

class _RepositoriesScreenState extends State<RepositoriesScreen> {
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
    _loadMore();
  }

  var _responses = [];
  var _page = 1;
  var _isLoading = false;
  ScrollController _scrollController = ScrollController();

  Future<void> _loadMore() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
    }
    var result = await get(
        "https://api.github.com/orgs/scorelab/repos?page=$_page&client_id=${Score.CLIENT_ID}&client_secret=${Score.CLIENT_SECRET}");
    setState(() {
      _isLoading = false;
      _responses.addAll(json.decode(result.body));
    });
    _page++;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _responses.length + 1,
        itemBuilder: (context, index) {
          if (_responses.length == index) {
            return Visibility(
              visible: _isLoading,
              child: Center(
                child: Opacity(
                  opacity: _isLoading ? 0.9 : 0.0,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          return ListTile(
            leading: Icon(FontAwesomeIcons.gitAlt),
            title: Text(_responses[index]['name']),
            subtitle: Text(
              _responses[index]['description'] ?? "",
              overflow: TextOverflow.fade,
              maxLines: 2,
              softWrap: false,
            ),
            trailing: Text(_responses[index]['language'] ?? ""),
            onTap: () {
              onClickTile(_responses[index]);
            },
          );
        },
      ),
    );
  }

  void onClickTile(dynamic repository) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RepositoryScreen(
                  repository: repository,
                )));
  }
}
