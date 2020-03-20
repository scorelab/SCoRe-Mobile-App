import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;

  TagWidget({@required this.icon, @required this.title, @required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.white, style: BorderStyle.solid, width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Wrap(
        spacing: 10.0,
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Icon(icon),
          Text(title),
          Container(
            width: 2,
            color: Colors.white,
            height: 26.0,
          ),
          Text(count.toString()),
        ],
      ),
    );
  }
}
