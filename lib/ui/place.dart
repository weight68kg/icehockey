import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Place extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _place();
}

class _place extends State<Place> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget imageSection() {
      return Image.asset(
        "assets/lake.jpg",
        width: 600.0,
        height: 240.0,
        fit: BoxFit.cover,
      );
    }

    Widget titleSection() {
      return Container(
        padding: EdgeInsets.all(32),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Oeschinen Lake Campground",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Kandersteg, Switzerland",
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                Text("41"),
              ],
            )
          ],
        ),
      );
    }

    Widget buildButtonColumn(IconData iconDate, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconDate,
            color: color,
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButtonColumn(Icons.phone, "PHONE"),
            buildButtonColumn(Icons.near_me, "ROUTE"),
            buildButtonColumn(Icons.share, "SHARE"),
          ],
        ),
      );
    }

    Widget contentSection() {
      return new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Text(
          '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
          softWrap: true,
        ),
      );
    }

    Widget getColum() {
      return ListView(
        children: <Widget>[
          imageSection(),
          titleSection(),
          buttonSection(),
          contentSection(),
        ],
      );
    }

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: getColum(),
      ),
    );
  }
}
