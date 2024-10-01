import 'package:flutter/material.dart';
import 'package:platzi_trip_app/User/model/user.dart';

class Place {
  late String id;
  String name;
  String description;
  String location;
  String urlImage;
  int? likes;
  User? userOwner;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      required this.location,
      required this.urlImage,
      this.likes,
      this.userOwner});
}
