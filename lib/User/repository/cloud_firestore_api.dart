import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trip_app/Place/model/place.dart';
import 'package:platzi_trip_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzi_trip_app/User/model/user.dart' as user_model;
import 'package:platzi_trip_app/User/ui/widgets/profile_place.dart';

// ignore_for_file: non_constant_identifier_names

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(user_model.User user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return await ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      //'myPlaces': user.myPlaces,
      //'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);

    User? user = _auth.currentUser;

    if (user != null) {
      await refPlaces.add({
        'name': place.name,
        'description': place.description,
        'location': place.location,
        'urlImage': place.urlImage,
        'likes': place.likes,
        'userOwner': _db.doc("$USERS/${user.uid}"), // reference
      }).then((DocumentReference dr) {
        dr.get().then((DocumentSnapshot snapshot) {
          // Obtengo el id del place que se acaba de insertar a firestore.
          final placeId = snapshot.id;
          // Obtengo el usuario cuyo identificador ser user.uid y lo almaceno en el objeto tipo DocumentReference
          DocumentReference refUsers = _db.collection(USERS).doc(user.uid);
          // Agrego una referencia del place insertado en el array 'myPlaces' del usuario.
          refUsers.update({
            'myPlaces': FieldValue.arrayUnion([_db.doc("$PLACES/$placeId")])
          });
        });
      });
    }
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = [];
    for (var p in placesListSnapshot) {
      profilePlaces.add(ProfilePlace(Place(
          name: p['name'],
          description: p['description'],
          location: p['location'],
          urlImage: p['urlImage'],
          likes: p['likes'])));
    }
    return profilePlaces;
  }

  List<CardImageWithFabIcon> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageWithFabIcon> placesCard = [];
    IconData iconData = Icons.favorite_border;

    for (var p in placesListSnapshot) {
      placesCard.add(CardImageWithFabIcon(
        pathImage: p["urlImage"],
        iconData: iconData,
        left: 20.0,
      ));
    }

    return placesCard;
  }
}
