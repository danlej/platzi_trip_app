import 'package:flutter/material.dart';
import 'package:platzi_trip_app/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("assets/images/beach.jpg"),
          CardImage("assets/images/beach_palm.jpg"),
          CardImage("assets/images/beach_sunset.jpg"),
          CardImage("assets/images/mountain.jpg"),
          CardImage("assets/images/mountain_stars.jpg"),
          CardImage("assets/images/sunset.jpg"),
          CardImage("assets/images/river.jpg")
        ],
      ),
    );
  }
}
