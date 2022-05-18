// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  //const GradientBack({Key? key}) : super(key: key);

  String title = "Popular";
  double altura = 250.0;

  GradientBack({required this.title, required this.altura});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        height: altura,
        width: screenWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF449DD1),
                  Color(0xFF192BC2),
                  //Color(0xFF150578),
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        // child: Text(
        //   title,
        //   style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 30.0,
        //       fontFamily: "Epilogue",
        //       fontWeight: FontWeight.bold),
        // ),
        child: Stack(
          children: [
            FittedBox(
              fit: BoxFit.none,
              alignment: Alignment(0.8, 1.5),
              child: Container(
                width: screenHeight,
                height: screenHeight,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  borderRadius: BorderRadius.circular(screenHeight / 2),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.none,
              alignment: Alignment(-0.5, 1.5),
              child: Container(
                width: screenHeight,
                height: screenHeight,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  borderRadius: BorderRadius.circular(screenHeight / 2),
                ),
              ),
            ),
          ],
        )
        //alignment: Alignment(-0.9, -0.6),
        );
  }
}
