import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:score_app/screens/repositories/repository_screen.dart';

class RepositoryListTile extends StatelessWidget {
  final dynamic details;
  RepositoryListTile({@required this.details});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(FontAwesomeIcons.gitAlt),
      title: Text(details['name']),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            details['description'] ?? "",
            overflow: TextOverflow.fade,
            maxLines: 2,
            softWrap: false,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesomeIcons.solidStar, size: 16),
              SizedBox(width: 8),
              Text(details['stargazers_count'].toString() ?? "0"),
              SizedBox(width: 8),
              Icon(FontAwesomeIcons.codeBranch, size: 16),
              SizedBox(width: 8),
              Text(details['forks_count'].toString() ?? "0"),
              SizedBox(width: 8),
              Text(details['language'] ?? ""),
            ],
          )
        ],
      ),
      trailing: details['fork']
          ? Icon(FontAwesomeIcons.codeBranch)
          : Icon(FontAwesomeIcons.book),
      onTap: () {
        onClickTile(context, details);
      },
    );
  }

  void onClickTile(BuildContext context, dynamic repository) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RepositoryScreen(
                  repository: repository,
                )));
  }
}
