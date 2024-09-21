import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/gradient_back.dart';
import 'package:platzi_trip_app/widgets/profile_info.dart';
import 'package:platzi_trip_app/widgets/profile_menu_bar.dart';

class ProfileHeaderAppbar extends StatelessWidget {
  const ProfileHeaderAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        GradientBack("Profile", 450.0),
        ProfileInfo(),
        ProfileMenuBar()
      ],
    );
  }
}
