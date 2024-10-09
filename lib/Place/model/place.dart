import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trip_app/User/model/user.dart';

class Place {
  String? id;
  String name;
  String description;
  String location;
  String urlImage;
  int likes;
  bool liked;
  DateTime? creationDate;
  List<User>? usersLiked;
  User? userOwner;

  Place(
      {Key? key,
      this.id,
      required this.name,
      required this.description,
      required this.location,
      required this.urlImage,
      this.likes = 0,
      this.liked = false,
      this.usersLiked,
      this.creationDate,
      this.userOwner});

  static Future<Place> fromFirestore(
      Map<String, dynamic> data, String documentId) async {
    DocumentReference? userOwnerRef = data['userOwner'];

    User? userOwner;
    if (userOwnerRef != null) {
      DocumentSnapshot userSnapshot = await userOwnerRef.get();
      userOwner = User.fromFirestore(
          userSnapshot.data() as Map<String, dynamic>, userSnapshot.id);
    }

    return Place(
      id: documentId,
      name: data['name'],
      description: data['description'],
      location: data['location'],
      urlImage: data['urlImage'],
      likes: data['likes'] ?? 0,
      usersLiked: List<User>.from(data['usersLiked'] ?? []),
      creationDate: data['creationDate']?.toDate(),
      userOwner: userOwner,
    );
  }
}
