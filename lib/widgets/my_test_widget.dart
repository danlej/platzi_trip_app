import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/profile_card_image.dart';
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
      margin: const EdgeInsets.only(top: 20.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[profileName, profileEmail],
      ),
    );

    final photo = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0),
      width: 98.0,
      height: 98.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3.0, color: Colors.white70),
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );

    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 13.0),
          height: 320.0,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: Column(children: [
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
            const ProfileMenuBar(10.0)
          ]),
        ),
        const ProfileCardImage(
            pathImage: "assets/images/mountain.jpg",
            name: "Knuckles Mountains Range",
            description: "Hiking, Waterfall, Nature bath",
            category: "Scenert & Photography",
            steps: "Steps 123,123,123",
            imageMarginTop: 320.0)
      ],
    );
  }
}
