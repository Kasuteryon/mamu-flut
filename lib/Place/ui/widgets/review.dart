// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  //const Review({Key? key}) : super(key: key);

  String pathImage = 'assets/img/lebni.jpg';
  String name = "Lebni Escobar";
  String details = "1 review, 4 fotos";
  String comment = "Que lugar mas asombroso!";

  Review(this.pathImage, this.name, this.details, this.comment);

  @override
  Widget build(BuildContext context) {
    final photo = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(image: AssetImage(pathImage), fit: BoxFit.cover)),
    );

    final userName = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Epilogue", fontSize: 16.0),
      ),
    );

    final userInfo = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Epilogue", fontSize: 13.0, color: Color(0XFFa3a5a7)),
      ),
    );

    final userComment = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Epilogue",
            fontSize: 13.0,
            fontWeight: FontWeight.w900),
      ),
    );

    final userDetail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [userName, userInfo, userComment],
    );

    return Row(
      children: [photo, userDetail],
    );
  }
}
