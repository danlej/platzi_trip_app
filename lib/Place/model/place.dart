import 'package:flutter/material.dart';
import 'package:platzi_trip_app/User/model/user.dart';
//import 'package:platzi_trip_app/User/model/user.dart';

class Place {
  String? id;
  String name;
  String description;
  String location;
  String urlImage;
  int likes;
  bool liked;
  List<User>? usersLiked;
  //User? userOwner;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      required this.location,
      required this.urlImage,
      this.likes = 0,
      this.liked = false,
      this.usersLiked,
      this.id});
  //this.userOwner});
}
