import 'package:flutter/material.dart';
import 'package:trips/widgets/gradient_back.dart';
import 'package:trips/Place/ui/widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack(title: "Destinos", altura: 250.0),
        CardImageList(
          width: 300,
          height: 250,
          left: 30.0,
        )
      ],
    );
  }
}
