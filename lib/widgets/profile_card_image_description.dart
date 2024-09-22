import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/floating_action_button_green.dart';

class ProfileCardImageDescription extends StatelessWidget {
  final String name;
  final String description;
  final String category;
  final String steps;
  final double marginTop;

  const ProfileCardImageDescription(
      {super.key,
      required this.name,
      required this.description,
      required this.category,
      required this.steps,
      required this.marginTop});

  @override
  Widget build(BuildContext context) {
    final photoName = Text(
      name,
      textAlign: TextAlign.left,
      style: const TextStyle(
          fontFamily: "Lato", fontSize: 19.0, fontWeight: FontWeight.bold),
    );

    final photoDescription = Text(
      description,
      textAlign: TextAlign.left,
      style: const TextStyle(
          fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFA3A5A7)),
    );

    final photoCategory = Text(
      category,
      textAlign: TextAlign.left,
      style: const TextStyle(
          fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFA3A5A7)),
    );

    final photoSteps = Text(
      steps,
      textAlign: TextAlign.left,
      style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFFD9AD33)),
    );

    final profileCard = Card(
      margin: EdgeInsets.only(top: marginTop, left: 60.0),
      color: Colors.white,
      shadowColor: Colors.black54,
      elevation: 6.0,
      child: SizedBox(
        width: 290,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              photoName,
              photoDescription,
              photoCategory,
              photoSteps
            ],
          ),
        ),
      ),
    );

    return Stack(
      alignment: const Alignment(0.85, 1.05),
      children: <Widget>[profileCard, const FloatingActionButtonGreen()],
    );
  }
}
