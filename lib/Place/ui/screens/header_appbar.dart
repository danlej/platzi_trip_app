import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/gradient_back.dart';
import 'package:platzi_trip_app/Place/ui/widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // GradientBack(title: "Bienvenido!", height: 250.0),
        GradientBack(height: 250.0),
        const CardImageList()
      ],
    );
  }
}
