import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileInfo extends StatelessWidget {
  final String pathImage = "assets/images/man01.png";
  final String name = "Pathum Tzoo";
  final String email = "pathumtzoo1@gmail.com";

  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final profileName = Text(
      name,
      textAlign: TextAlign.left,
      style: const TextStyle(
          color: Colors.white70, fontFamily: "Lato", fontSize: 20.0),
    );

    final profileEmail = Text(
      email,
      textAlign: TextAlign.left,
      style: const TextStyle(
          fontFamily: "Lato", fontSize: 14.0, color: Color(0xFFA3A5A7)),
    );

    final profileDetails = Container(
      margin: const EdgeInsets.only(top: 132.0, left: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[profileName, profileEmail],
      ),
    );

    final photo = Container(
      margin: const EdgeInsets.only(top: 115.0, left: 25.0),
      width: 98.0,
      height: 98.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.5, color: Colors.white70),
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );

    return Row(
      children: <Widget>[
        Column(
          children: [
            photo,
          ],
        ),
        profileDetails
      ],
    );
  }
}
