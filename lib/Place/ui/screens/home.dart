// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trips/Place/ui/widgets/description_place.dart';
import 'package:trips/Place/ui/screens/header_appbar.dart';
import 'package:trips/Place/ui/widgets/review_list.dart';

class HomeTrips extends StatelessWidget {
  const HomeTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            DescriptionPlace("Nicaragua", 4,
                "Regocíjate con las únicas y maravillosas experiencias que los destinos turísticos de nuestro país pueden ofrecerte. Descubre Cada uno de ellos y disfruta la experiencia Nicaraguense."),
            ReviewList()
          ],
        ),
        HeaderAppBar()
      ],
    );
  }
}
