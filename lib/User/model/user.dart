//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trip_app/Place/model/place.dart';

class User {
  final String uid;
  final String? name;
  final String? email;
  final String? photoURL;
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
    //static Future<User> fromFirestore(Map<String, dynamic> data, String documentId) async {
    // Cargamos la referencia de myPlaces
    /* List<DocumentReference> myPlacesRefs =
        List<DocumentReference>.from(data['myPlaces']);
    List<Place> myPlaces = []; */

    /* for (var placeRef in myPlacesRefs) {
      DocumentSnapshot placeSnapshot = await placeRef.get();
      myPlaces.add(await Place.fromFirestore(
          placeSnapshot.data() as Map<String, dynamic>, placeSnapshot.id));
    } */

    // Cargamos la referencia de myFavoritePlaces
    /* List<DocumentReference> myFavoritePlacesRefs =
        List<DocumentReference>.from(data['myFavoritePlaces']);
    List<Place> myFavoritePlaces = []; */

    /* for (var placeRef in myFavoritePlacesRefs) {
      DocumentSnapshot placeSnapshot = await placeRef.get();
      myFavoritePlaces.add(await Place.fromFirestore(
          placeSnapshot.data() as Map<String, dynamic>, placeSnapshot.id));
    } */

    return User(
        uid: data['uid'],
        name: data['name'],
        email: data['email'],
        photoURL: data['photoURL']);
    /* myPlaces: myPlaces,
        myFavoritePlaces: myFavoritePlaces); */
  }
}
