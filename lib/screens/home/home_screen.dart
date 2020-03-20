import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:score_app/screens/chat/chat_screen.dart';
import 'package:score_app/screens/repositories/repositories_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _screens = [
    RepositoriesScreen(),
    ChatScreen(),
  ];

  var _selectedIndex = 0;

  _onTapBottonNavBarItem(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/score.png"),
        title: Text("Score Mobile"),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.github),
            title: Text("Repositories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            title: Text("Chat"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapBottonNavBarItem,
      ),
    );
  }
}
