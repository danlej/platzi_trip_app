import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/profile_menu_bar.dart';

class MyTestWidget extends StatelessWidget {
  final String pathImage = "assets/images/man01.png";
  final String name = "Pathum Tzoo";
  final String email = "pathumtzoo1@gmail.com";

  const MyTestWidget({super.key});

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
          fontFamily: "Lato", fontSize: 14.0, color: Colors.white30),
    );

    final profileDetails = Container(
      margin: const EdgeInsets.only(top: 35.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[profileName, profileEmail],
      ),
    );

    final photo = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0),
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3.0, color: Colors.white70),
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Column(
                children: [
                  photo,
                ],
              ),
              profileDetails
            ],
          ),
          const ProfileMenuBar()
        ],
      ),
    );
  }
}
