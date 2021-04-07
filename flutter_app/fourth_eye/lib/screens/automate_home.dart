import 'package:flutter/material.dart';
import 'globals.dart';

class AutomateHome extends StatefulWidget {
  @override
  _AutomateHomeState createState() => _AutomateHomeState();
}

class _AutomateHomeState extends State<AutomateHome> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Header(title: "Automate Home",iconData: Icons.tune,),
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