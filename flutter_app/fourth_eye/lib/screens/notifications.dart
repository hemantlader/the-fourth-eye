import 'package:flutter/material.dart';
import 'globals.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Header(title: "Notifications",iconData: Icons.notifications,),
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