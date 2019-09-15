import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
    var result =
        await get("https://api.github.com/orgs/scorelab/repos?page=$_page");
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
            title: Text("$index ${_responses[index]['name']}"),
          );
        },
      ),
    );
  }
}
