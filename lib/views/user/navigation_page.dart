import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  static String tag = "navigation";
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var _bodies = [
    Container(child: Text("ini page home")),
    Container(child: Text("ini page search")),
    Container(child: Text("ini page account")),
  ];

  int _selectedBody = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigate"),
      ),
      body: _bodies[_selectedBody],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBody,
        onTap: (value) {
          setState(() {
            _selectedBody = value;
          });
        },
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "Account", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
