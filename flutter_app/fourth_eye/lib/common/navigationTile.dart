import 'package:flutter/material.dart';
import 'myThemeStyle.dart';

class NavigationTile extends StatefulWidget {
  String title;
  IconData icon;
  bool isSelected ;
  AnimationController animationController;
  NavigationTile({@required this.title, @required this.icon, @required this.animationController , this.isSelected:false});

  @override
  _NavigationTileState createState() {
    return _NavigationTileState();
  }
}

class _NavigationTileState extends State<NavigationTile> {
  final maxWidth = 250.0;
  final minWidth = 50.0;
  
  Animation<double> widthAnimation;
  @override 
  void initState(){
    super.initState();
    widthAnimation = Tween<double>(begin: maxWidth , end: minWidth).animate(widget.animationController);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: widthAnimation.value,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      child: Row(
        children: <Widget>[
          Icon(widget.icon, 
          color: (widget.isSelected) ? selected :Colors.white30, 
          size: 25,),
          (widthAnimation.value >=60) ? Container(): SizedBox(
            width: 10,
          ),
          (widthAnimation.value >=60) ? Container()
              :Text(widget.title ,
              style: (widget.isSelected) ? listSelected : listDefault ),
        ],
      ),
    );
  }
}
