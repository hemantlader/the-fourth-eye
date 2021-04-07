import 'package:flutter/material.dart';

class CreditModel {
  String name;
  String role;
  String desc;
  String image;

  CreditModel({
    @required this.name,
    @required this.role,
    @required this.desc,
    this.image  = "assets/spin.png"
  });
}

List<CreditModel> creditList = [
  CreditModel(
      name: "The Fourth Eye",
      role: "Smart Home-Surveilliance System",
      desc: "This is The Fourth Eye v.1.0. This is the project made by GEC Bilaspur CSE students.\n\n Slide left for credits",
      ),
  CreditModel(
      name: "Priyanshi Singh",
      role: "Web Developer & Designer",
      desc: "She is Priyanshi Singh. Contributed her skills to make this project ready.",
      image: "assets/priyanshi.jpeg"),
  CreditModel(
      name: "Hemant Lader",
      role: "Team Leader & App Developer",
      desc: "He is Hemant Lader. He contributed a lot to make this project ready and leading the project work",
      image:"assets/hemant.jpg"),
  CreditModel(
      name: "Bhawna Pandey",
      role: "Python Programmer",
      desc: "She is Bhawna Pandey. Contributed her skills to make this project ready",
      image:"assets/bhawna.jpg",
      ),
  CreditModel(
      name: "Abhishek Kujur",
      role: "UI / UX Designer",
      desc: "He is Abhishek Kujur.He contributed his skills to make this project ready",
      image: "assets/abhishek.jpg"
      ),
];
