import 'package:flutter/material.dart';
import 'package:trips/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  final double width;
  final double height;
  final double left;

  const CardImageList(
      {Key? key, required this.width, required this.height, required this.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: [
          CardImage(
            pathImage: "./assets/img/crochet.jpg",
            iconData: Icons.favorite,
            width: width,
            height: height,
            isUploading: false,
            onPressed: () {},
            left: left,
          ),
          CardImage(
            pathImage: "./assets/img/vestir.jpg",
            iconData: Icons.favorite,
            width: width,
            height: height,
            isUploading: false,
            onPressed: () {},
            left: left,
          ),
          CardImage(
            pathImage: "./assets/img/uniforme.jpg",
            iconData: Icons.favorite,
            width: width,
            height: height,
            isUploading: false,
            onPressed: () {},
            left: left,
          ),
        ],
      ),
    );
  }
}
