import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;
  NavigationModel({@required this.title, @required this.icon});
}
List<NavigationModel> NavigationList = [
  NavigationModel(title:"Dashboard", icon: Icons.dashboard),
  NavigationModel(title:"Live Feed", icon: Icons.videocam),
  NavigationModel(title:"Notification", icon: Icons.notifications),
  NavigationModel(title:"Automate Home", icon: Icons.tune),
  NavigationModel(title:"People", icon: Icons.people),
]; 