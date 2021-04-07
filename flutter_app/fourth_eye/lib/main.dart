import 'package:flutter/material.dart';
import './screens/splash.dart';
import './screens/homepage.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(FourthEye());

class FourthEye extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Fourth Eye",
      theme: ThemeData(
        fontFamily: "Montserrat",
        accentColor: Colors.blueAccent,
        primaryColor: Colors.blueGrey
      ),
      debugShowCheckedModeBanner: false,
      home: homepage()
    );
  }
}


class Test extends StatefulWidget {
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      allowFileURLs: true,
      withJavascript: true,
      appBar: AppBar(
        title: Text("LiveFeed"),
      ),
      enableAppScheme: true,
      url: "http://192.168.43.76:5000/video_feed",
      initialChild: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}