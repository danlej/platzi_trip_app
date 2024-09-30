import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;

  const TitleHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Flexible(
        child: Container(
            padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
            width: screenWidth,
            child: Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                ))));
  }
}
