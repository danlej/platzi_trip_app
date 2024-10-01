import 'package:flutter/material.dart';
import 'package:platzi_trip_app/Place/ui/widgets/card_image_with_fab_icon.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CardImageWithFabIcon(
              pathImage: "assets/images/beach.jpg",
              iconData: Icons.favorite_border),
          CardImageWithFabIcon(
              pathImage: "assets/images/beach_palm.jpg",
              iconData: Icons.favorite_border,
              left: 20.0),
          CardImageWithFabIcon(
              pathImage: "assets/images/beach_sunset.jpg",
              iconData: Icons.favorite_border,
              left: 20.0),
          CardImageWithFabIcon(
              pathImage: "assets/images/mountain.jpg",
              iconData: Icons.favorite_border,
              left: 20.0),
          CardImageWithFabIcon(
              pathImage: "assets/images/mountain_stars.jpg",
              iconData: Icons.favorite_border,
              left: 20.0),
          CardImageWithFabIcon(
              pathImage: "assets/images/sunset.jpg",
              iconData: Icons.favorite_border,
              left: 20.0),
          CardImageWithFabIcon(
              pathImage: "assets/images/river.jpg",
              iconData: Icons.favorite_border,
              left: 20.0)
        ],
      ),
    );
  }
}
