import 'package:flutter/material.dart';
import 'package:icehockey/ui/place.dart';

import 'ui/headline.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                title: new Text(
                  "HOME",
                ),
                icon: new Icon(Icons.home)),
            BottomNavigationBarItem(
                title: new Text(
                  "HEADLINE",
                ),
                icon: Icon(Icons.view_headline)),
            BottomNavigationBarItem(
                title: new Text(
                  "PLACE",
                ),
                icon: new Icon(Icons.place)),
            BottomNavigationBarItem(
                title: new Text(
                  "PERSON",
                ),
                icon: Icon(Icons.person))
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blue,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = [
    ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    ),
    Headline(),
    Place(),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
  ];


}
