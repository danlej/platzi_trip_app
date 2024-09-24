import 'package:flutter/material.dart';
import 'profile_place.dart';
import 'package:platzi_trip_app/Place/model/place.dart';

// ignore: must_be_immutable
class ProfilePlacesList extends StatelessWidget {
  Place place = Place(
      'Knuckles Mountains Range',
      'Hiking. Water fall hunting. Natural bath',
      'Scenery & Photography',
      '123,123,123');
  Place place2 = Place('Mountains', 'Hiking. Water fall hunting. Natural bath',
      'Scenery & Photography', '321,321,321');

  ProfilePlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace('assets/images/river.jpg', place),
          ProfilePlace('assets/images/mountain.jpg', place2),
        ],
      ),
    );
  }
}
