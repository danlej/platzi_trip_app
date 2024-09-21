import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final String pathImage;
  final String name;
  final String details;
  final String comment;

  const Review(this.pathImage, this.name, this.details, this.comment,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final starHalf = Container(
      margin: const EdgeInsets.only(right: 2.0),
      child: const Icon(
        Icons.star_half,
        color: Color(0xFFF2C611),
        size: 18.0,
      ),
    );

    final starBorder = Container(
      margin: const EdgeInsets.only(right: 2.0),
      child: const Icon(
        Icons.star_border,
        color: Color(0xFFF2C611),
        size: 18.0,
      ),
    );

    final star = Container(
      margin: const EdgeInsets.only(right: 2.0),
      child: const Icon(
        Icons.star,
        color: Color(0xFFF2C611),
        size: 18.0,
      ),
    );

    final userComment = Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontFamily: "Lato", fontSize: 13.0, fontWeight: FontWeight.w900),
      ),
    );

    final userInfo = Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: Text(
            details,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFA3A5A7)),
          ),
        ),
        Row(
          children: <Widget>[star, star, star, starHalf, starBorder],
        )
      ],
    );

    final userName = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[userName, userInfo, userComment],
    );

    final photo = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );

    return Row(children: <Widget>[photo, userDetails]);
  }
}
