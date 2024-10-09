import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trip_app/Place/model/place.dart';
import 'package:platzi_trip_app/User/model/user.dart';
import 'package:platzi_trip_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trip_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceDataFirestore(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);

  List<Place> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot, User user) =>
      _cloudFirestoreAPI.buildPlaces(placesListSnapshot, user);

  Future likePlace(Place place, String uid) =>
      _cloudFirestoreAPI.likePlace(place, uid);

  Stream<QuerySnapshot> myPlacesListStream(String uid) =>
      _cloudFirestoreAPI.myPlacesListStream(uid);

  Future<Place> getPlace(String id) =>
      _cloudFirestoreAPI.getPlace(id).then((DocumentSnapshot snapshot) {
        return Place.fromFirestore(
            snapshot.data() as Map<String, dynamic>, snapshot.id);
      });

  Future<Place> myLastPlace(String uid) => _cloudFirestoreAPI
      .myLastPlace(uid)
      .then((DocumentSnapshot snapshot) => Place.fromFirestore(
          snapshot.data() as Map<String, dynamic>, snapshot.id));
}
