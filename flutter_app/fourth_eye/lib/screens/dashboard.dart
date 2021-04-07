import "package:flutter/material.dart";
import 'globals.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Dashboard extends StatefulWidget {
  createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Stream<Image> getFeed() async* {
  //   while (true){
  //     yield Image(image: NetworkImage("http://192.168.43.76:5000/video_feed.jpg"),);
  //   }
  // }

  final DatabaseReference db = FirebaseDatabase.instance.reference().child('devices');
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Header(title: "DashBoard", iconData: Icons.dashboard,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              // color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage("assets/clouds.jpg"),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            // color: Colors.blueAccent,
                            color: Colors.black54,
                            spreadRadius: 3,
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Center(child: Text("Weather")),
                    ),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5),
                        // image: DecorationImage(
                        //   image: AssetImage("assets/clouds.jpg"),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            // color: Colors.blueAccent,
                            color: Colors.black54,
                            spreadRadius: 3,
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Center(child: Text("Notication")),
                    ),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage("assets/automation.jpg"),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            // color: Colors.blueAccent,
                            color: Colors.black54,
                            spreadRadius: 3,
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Center(child: Text("Switch Control",style: TextStyle(color: Colors.white, fontSize: 25),)),
                    ),
                    
                    // Expanded(
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(context,
                    //           MaterialPageRoute(builder: (context) {
                    //         return WebviewScaffold(
                    //           appBar: AppBar(
                    //                 title: Text("Live Feed"),
                    //                 backgroundColor: Color.fromARGB(255, 3, 11, 22),
                    //                 centerTitle: true,
                    //               ),
                    //           url: "http://www.google.co.in/",
                    //           withJavascript: true,
                    //         );
                    //       }));
                    //     },
                    //     child: Container(
                    //       height: 80,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5),
                    //         color: Colors.white,
                    //         boxShadow: [
                    //           BoxShadow(
                    //             blurRadius: 5,
                    //             color: Colors.blueAccent,
                    //             spreadRadius: 1,
                    //           )
                    //         ],
                    //       ),
                    //       margin: EdgeInsets.all(10),
                    //       padding: EdgeInsets.all(10),
                    //       child: Center(child: Text("data 3")),
                    //     ),
                    //   ),
                    // ),

                    // StreamBuilder(
                    //   stream: getFeed(),
                    //   builder: (context,snapshot){
                    //     return Container(child: snapshot.data,);
                    //   },
                    // )
                    // ImageStream(

                    // ),
                    // Image(
                    //   image: ImageProvider() //NetworkImage("http://192.168.43.76:5000/video_feed",
                    //   ),
                    //   //192.168.43.76
                    //   // child:
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
