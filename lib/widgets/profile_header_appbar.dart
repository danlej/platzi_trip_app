import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/gradient_back.dart';
import 'package:platzi_trip_app/widgets/profile_card_image.dart';
import 'package:platzi_trip_app/widgets/profile_info.dart';
import 'package:platzi_trip_app/widgets/profile_menu_bar.dart';

class ProfileHeaderAppbar extends StatelessWidget {
  const ProfileHeaderAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBack("Profile", 420.0),
        const ProfileInfo(),
        const ProfileMenuBar(225.0),
        Container(
          margin: const EdgeInsets.only(top: 300.0),
          child: ListView(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            children: const <Widget>[
              ProfileCardImage(
                  pathImage: "assets/images/mountain_stars.jpg",
                  name: "Knuckles Mountains Range",
                  description: "Hiking, Waterfall, Nature bath",
                  category: "Scenert & Photography",
                  steps: "Steps 123,123,123",
                  imageMarginTop: 0.0),
              ProfileCardImage(
                  pathImage: "assets/images/beach.jpg",
                  name: "Philipines beach",
                  description: "Swimming, Snorkeling, Termal water",
                  category: "Scenery & Photography",
                  steps: "Steps 234,234,234",
                  imageMarginTop: 20.0)
            ],
          ),
        ),
      ],
    );
  }
}
