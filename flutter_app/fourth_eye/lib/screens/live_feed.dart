import 'package:flutter/material.dart';
import 'globals.dart';

class LiveFeed extends StatefulWidget {
  @override
  _LiveFeedState createState() => _LiveFeedState();
}

class _LiveFeedState extends State<LiveFeed> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Header(title: "Live Feed",iconData: Icons.videocam,),
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