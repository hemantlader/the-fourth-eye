import "package:flutter/material.dart";
import '../common/mynavigation_drawer.dart';
import 'globals.dart';

_homepageState mainContext;

class homepage extends StatefulWidget{

  @override
  _homepageState createState(){
    mainContext =_homepageState();
    return mainContext;
  }
}
class _homepageState extends State<homepage> {

  Widget test = pageChild;

  void update(){
    setState(() {
     test = pageChild; 
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Homepage"),
      //   backgroundColor: Color.fromARGB(255, 3, 11, 22),
      // ),
      body : Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlue, Colors.lightBlueAccent],
                end: FractionalOffset.centerLeft,
                begin: FractionalOffset.centerRight,
              ),
            ),
          child: Row(children: <Widget>[
            SizedBox(width: 50,child: Container(color: Colors.transparent)),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: test // Page(context:context),
                ),
              ),
            )
          ],),
        ),
        MyNavigationDrawer(),
      ], ),
      // body:Text("data")
    );
  }
}
// Drawer(
//         child: Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             Container(
//               child: Opacity(
//                 child: Image(
//                 image: AssetImage("assets/boxes.jpg"),
//                 color: Color.fromARGB(200, 20, 41, 63),
//                 colorBlendMode: BlendMode.multiply,
//                 fit: BoxFit.cover,
//               ),
//               opacity: 1.0,
//               )
//             ),
//             ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountEmail: Text("hemantlader@gmail.com"),
//               accountName: Text("Hemant Lader"),
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/6347.jpg"),
//                   fit: BoxFit.cover
//                 ),
//                 gradient: LinearGradient(
//                   colors: <Color>[Color.fromARGB(255, 255, 255, 255)
//                    , Color.fromARGB(100, 0, 0, 0)],
//                   begin: FractionalOffset.bottomCenter,
//                   end: FractionalOffset.topCenter
//                 )
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.videocam,color: Colors.white ),
//                 title: Text("LiveFeed", style: TextStyle(color: Colors.white),),
                
//               ),
 
//               ListTile(
//                 leading: Icon(Icons.tune,color: Colors.white ),

//                 title: Text("Switch Control", style: TextStyle(color: Colors.white),),
                
//               ),
//               ListTile(
//                 leading: Icon(Icons.people,color: Colors.white ),
//                 title: Text("People", style: TextStyle(color: Colors.white),),
                
//               ),
//               ListTile(
//                 leading: Icon(Icons.person,color: Colors.white ),
//                 title: Text("User", style: TextStyle(color: Colors.white),),
                
//               ),
//               Divider(color: Colors.white54),
//               ListTile(
//                 onTap: (){
//                   Navigator.of(context).pop();
//                 },
//                 leading: Icon(Icons.close,color: Colors.white ),
//                 title: Text("Close", style: TextStyle(color: Colors.white),),
//               ),
//           ],
//         )
//           ],
//         )
//       ),