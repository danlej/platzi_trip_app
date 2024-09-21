import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/description_place.dart';
import 'package:platzi_trip_app/widgets/review_list.dart';
import 'package:platzi_trip_app/helpers/lorem_ipsum.dart';
import 'package:platzi_trip_app/widgets/header_appbar.dart';

class HomeTrips extends StatelessWidget {
  const HomeTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace("Duwili Ella", 5, loremIpsum(50)),
            ReviewList()
          ],
        ),
        const HeaderAppBar()
      ],
    );
  }
}
