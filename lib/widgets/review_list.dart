import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/review.dart';

class ReviewList extends StatelessWidget {
  final List<String> pathImages = [
    "assets/images/people.jpg",
    "assets/images/brook.jpg",
    "assets/images/luffy.jpg",
    "assets/images/robin.jpg",
    "assets/images/smoker.jpg",
    "assets/images/zoro.jpg"
  ];
  final List<String> names = [
    "Varuna Yasas",
    "Brook",
    "Luffy",
    "Robin",
    "Smoker",
    "Zoro"
  ];
  final List<String> details = [
    "1 review . 5 photos",
    "5 review . 1 photos",
    "19 review . 25 photos",
    "1 review . 2 photos",
    "29 review . 55 photos",
    "1 review . 5 photos"
  ];
  final List<String> comments = [
    "There is an amazing place in Sri Lanka.",
    "Everyone would love to be in that nice place!",
    "Somewhere in the heaven!",
    "Something special in that special landscape.",
    "Great holidays! Good drinks, better food!",
    "I'll be back next year!"
  ];

  ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review(pathImages[0], names[0], details[0], comments[0]),
        Review(pathImages[1], names[1], details[1], comments[1]),
        Review(pathImages[2], names[2], details[2], comments[2]),
        Review(pathImages[3], names[3], details[3], comments[3]),
        Review(pathImages[4], names[4], details[4], comments[4]),
        Review(pathImages[5], names[5], details[5], comments[5])
      ],
    );
  }
}
