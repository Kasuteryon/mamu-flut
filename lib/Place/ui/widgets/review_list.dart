import 'package:flutter/material.dart';
import 'package:trips/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  //const ReviewList ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Review("assets/img/lebni.jpg", "Lebni Lowen", "4 estrellas",
            "Que genial destino!"),
        // Review("assets/img/sara.jpg", "Lalieshka Rivas", "0 estrellas",
        //     "Sáquenme de Nicaragua...!"),
        Review("assets/img/angelina.jpg", "Angelina Jolie", "5 estrellas",
            "Asombroso, una experiencia emancipadora,"),
        Review("assets/img/danny.png", "Danny DeVito", "1 estrella",
            "Una experiencia espectacular...!"),
        Review("assets/img/scarlett.jpg", "Scarlett Johansson", "3 estrellas",
            "¡No me quería ir! Increible lugar jaja."),
      ],
    );
  }
}
