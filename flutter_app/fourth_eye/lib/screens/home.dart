import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("MainScreen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage("assets/spin.png"),
            height: 100.0,
            width: 100.0,),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: 
              Text("Live Feed from camera",
              style: TextStyle(
                fontSize: 20.0
              ),),
            ),
            Card(
              child: Stack(
                children: <Widget>[
                  Image(image: AssetImage("assets/6347.jpg"),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("theFourthEye",
                    style: TextStyle(color: Colors.white),),
                  ),
                  Container(
                    alignment: AlignmentDirectional.topEnd,
                    child: Image(image: AssetImage("assets/spin.png"),
                    height: 30.0,
                    width: 30.0,),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}