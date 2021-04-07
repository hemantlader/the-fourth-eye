import '../screens/dashboard.dart';
import "package:flutter/material.dart";
import 'homepage.dart';

class Header extends StatelessWidget {
  final String title;
  final iconData ;

  Header({@required this.title , @required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Container(
        color: Colors.blueAccent,
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage("assets/back5.jpg"),
                color: Colors.black54,
                colorBlendMode: BlendMode.multiply,
                fit: BoxFit.cover,
              ),
            ),
            Opacity(
              // GRADIENT LAYER
              opacity: 0.5,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      Color.fromARGB(180, 0, 0, 0),
                      Color.fromARGB(180, 3, 11, 22),
                      Color.fromARGB(150, 12, 35, 69)
                    ],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    iconData,
                    color: Colors.white70,     
                  )
                ]),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
