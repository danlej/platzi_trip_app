import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/profile_card_image_description.dart';

// ignore: must_be_immutable
class ProfileCardImage extends StatelessWidget {
  final String pathImage;
  final String name;
  final String description;
  final String category;
  final String steps;
  final double imageMarginTop;

  const ProfileCardImage(
      {required this.pathImage,
      required this.name,
      required this.description,
      required this.category,
      required this.steps,
      required this.imageMarginTop,
      super.key});

  @override
  Widget build(BuildContext context) {
    double descriptionMarginTop = 190 + imageMarginTop;
    final card = Container(
      height: 250.0,
      width: 380.0,
      margin: EdgeInsets.only(top: imageMarginTop, left: 15.0),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      children: <Widget>[
        card,
        ProfileCardImageDescription(
          name: name,
          description: description,
          category: category,
          steps: steps,
          marginTop: descriptionMarginTop,
        )
      ],
    );
  }
}
