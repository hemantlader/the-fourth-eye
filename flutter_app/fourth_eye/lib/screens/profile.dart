import 'package:flutter/material.dart';
import 'globals.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Header(title: "Profile",iconData: Icons.person,),
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