// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trips/widgets/button.dart';

class DescriptionPlace extends StatelessWidget {
  //const DescriptionPlace({Key? key}) : super(key: key);

  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    String descriptionDummy =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum';

    final star = Container(
      margin: EdgeInsets.only(
        top: 383.0,
        right: 3.0,
      ),
      child: Icon(
        Icons.star,
        color: Color(0xFFF2C611),
      ),
    );

    final starHalf = Container(
      margin: EdgeInsets.only(
        top: 383.0,
        right: 3.0,
      ),
      child: Icon(
        Icons.star_half,
        color: Color(0xFFF2C611),
      ),
    );

    final starEmpty = Container(
      margin: EdgeInsets.only(
        top: 383.0,
        right: 3.0,
      ),
      child: Icon(
        Icons.star_border,
        color: Color(0xFFF2C611),
      ),
    );

    final description = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Text(descriptionPlace,
          style: TextStyle(fontSize: 18.0, fontFamily: "Epilogue"),
          textAlign: TextAlign.justify),
    );

    final title_start = Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 380.0, left: 20.0, right: 20.0),
          child: Text(
            namePlace,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
                fontFamily: "Epilogue"),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: [star, star, star, starHalf, starEmpty],
        )
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title_start,
        description,
        ButtonPurple(
          buttonText: "Navegar",
          onPressed: () {},
        )
      ],
    );
  }
}
