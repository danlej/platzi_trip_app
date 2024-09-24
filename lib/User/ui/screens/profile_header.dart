import 'package:flutter/material.dart';
import 'package:platzi_trip_app/User/ui/widgets/user_info.dart';
import 'package:platzi_trip_app/User/ui/widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const title = Text(
      'Profile',
      style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0),
    );

    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: Column(
        children: <Widget>[
          const Row(
            children: <Widget>[title],
          ),
          UserInfo(
              'assets/images/woman02.png', 'Anahí Salgado', 'anahi@platzi.com'),
          const ButtonsBar()
        ],
      ),
    );
  }
}
