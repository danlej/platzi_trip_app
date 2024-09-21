import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/gradient_back.dart';
import 'package:platzi_trip_app/widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: <Widget>[GradientBack("Welcome!", 250.0), CardImageList()],
    );
  }
}
