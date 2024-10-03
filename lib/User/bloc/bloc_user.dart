import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/Place/model/place.dart';
import 'package:platzi_trip_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trip_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzi_trip_app/User/repository/auth_repository.dart';
import 'package:platzi_trip_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trip_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trip_app/User/model/user.dart' as user_model;
import 'package:platzi_trip_app/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {
  final authRepository = AuthRepository();

  // Flujo de datos Streams: Firebase ya viene con métodos que nos devuelven
  // el flujo de datos y nosotros decidimos que hacer con ese stream.
  // Si no tuvieramos ese flujo de datos utilizariamos la clase StreamController.
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  User? get currentUser => FirebaseAuth.instance.currentUser;

  // 1er Caso de uso de la clase User: SignIn a la aplicación Google.
  Future<User?> signIn() => authRepository.signInFirebase();

  // 2do Caso de uso de la clase User: SignOut de la aplicación Google.
  Future<void> signOut() async => authRepository.signOutFirebase();

  // 3er Caso de uso de la clase User: Registrar usuario en base de datos.
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(user_model.User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  // 4to Caso de uso de la clase User: Registrar lugares del usuario en base de datos.
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceDataFirestore(place);

  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().PLACES)
      .snapshots();

  Stream<QuerySnapshot> get placesStream => placesListStream;

  List<CardImageWithFabIcon> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot);

  // Stream con un filtro que me permite traer los places del usuario cuyo uid
  // paso como parámetro a dicho stream.
  Stream<QuerySnapshot> myPlacesListStream(String uid) => FirebaseFirestore
      .instance
      .collection(CloudFirestoreAPI().PLACES)
      .where("userOwner",
          isEqualTo: FirebaseFirestore.instance
              .doc("${CloudFirestoreAPI().USERS}/$uid"))
      .snapshots();

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);

  // 5to Caso de uso de la clase User: Subir un archivo a Firebase Storage.
  final firebaseStorageRepository = FirebaseStorageRepository();
  Future<UploadTask> uploadFile(String path, File image) =>
      firebaseStorageRepository.uploadFile(path, image);

  void checkCurrentUser() async {
    if (currentUser != null) {
      // ignore: avoid_print
      print("Usuario autenticado: ${currentUser!.displayName}");
    } else {
      // ignore: avoid_print
      print("No hay usuario autenticado");
    }
  }

  @override
  void dispose() {}
}
