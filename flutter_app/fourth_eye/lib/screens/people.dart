import 'package:flutter/material.dart';
import 'globals.dart';

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Header(title: "People",iconData: Icons.people,),
      Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Container(
            ),
          ],
        ),
    ],);
  }
}