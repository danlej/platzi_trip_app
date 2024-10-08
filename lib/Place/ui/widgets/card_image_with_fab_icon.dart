import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/floating_action_button_green.dart';

// ignore: must_be_immutable
class CardImageWithFabIcon extends StatelessWidget {
  final double height;
  final double width;
  final String pathImage;
  final VoidCallback? onPressedFabIcon;
  final IconData iconData;
  final Color iconColor;
  final double left;
  final bool internet;

  const CardImageWithFabIcon(
      {super.key,
      required this.pathImage,
      this.width = 250.0,
      this.height = 225.0,
      this.onPressedFabIcon,
      required this.iconData,
      this.iconColor = Colors.white70,
      this.left = 0.0,
      this.internet = true});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(left: left),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: internet
                ? CachedNetworkImageProvider(pathImage)
                : FileImage(File(pathImage)),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      alignment: const Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          iconData: iconData,
          iconColor: iconColor,
          onPressed: onPressedFabIcon,
        )
      ],
    );
  }
}
