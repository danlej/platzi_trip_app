import 'package:flutter/material.dart';
import 'package:platzi_trip_app/Place/model/place.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Place>? myPlaces;
  final List<Place>? myFavoritePlaces;

  User(
      {Key? key,
      required this.uid,
      required this.name,
      required this.email,
      required this.photoURL,
      this.myPlaces,
      this.myFavoritePlaces});

  factory User.fromFirestore(Map<String, dynamic> data, String documentId) {
    return User(
        uid: data['uid'],
        name: data['name'],
        email: data['email'],
        photoURL: data['photoURL']);
    //myPlaces: List.from(data['myPlaces']),
    //myFavoritePlaces: List.from(data['myFavoritePlaces']));
  }
}
