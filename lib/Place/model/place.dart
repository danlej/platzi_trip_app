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

  static List<Place> sortByCreationDate(List<Place> places) {
    // Ordena los lugares por creationDate en orden descendente
    places.sort((a, b) {
      // Si alguno de los creationDate es null, considera que va después
      if (a.creationDate == null && b.creationDate == null) {
        return 0; // Si ambos son null, son iguales en términos de orden
      } else if (a.creationDate == null) {
        return 1; // Los null van al final (después)
      } else if (b.creationDate == null) {
        return -1; // Los null van al final (después)
      } else {
        // Orden descendente: compara de mayor a menor
        return b.creationDate!.compareTo(a.creationDate!);
      }
    });

    return places;
  }
}
