import 'dart:async';
import "homepage.dart";
import "package:flutter/material.dart";

class Splash extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    Timer(Duration(seconds: 5),(){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => homepage()
        )
      );
    });
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage("assets/6347.jpg"),
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.multiply,
              ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        child: CircleAvatar(
                        radius: 70.0,
                        backgroundColor: Colors.redAccent,
                        child: Image(image: AssetImage("assets/spin.png")),
                      ),
                      transitionOnUserGestures: true,
                      tag:"spin",
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text("Fourth Eye",
                      style: TextStyle(
                        color: Color.fromARGB(255, 200, 230, 240),
                        fontSize: 35.0))
                    ],
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 200, 235, 255)),),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                      ),
                      Text("One stop solution for \n smart home surveillance",
                      style: TextStyle(
                        color: Color.fromARGB(255, 200, 230, 240),
                        fontSize: 15.0
                        ),
                      textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}