// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;

  const TitleHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Flexible(
      child: Container(
        width: screenWidth,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: "Epilogue",
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
