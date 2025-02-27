import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trip_app/Place/model/place.dart';
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
    // Si el documento no existe, se creará. Si el documento existe, su contenido
    // se fusionará con los datos recién proporcionados. Si queremos sobreescribir los datos SetOptions(merge: false)
    return await ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
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
        'creationDate': DateTime.now(),
        'userOwner': _db.doc("$USERS/${user.uid}"), // reference
        'usersLiked': [],
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
      profilePlaces.add(
        ProfilePlace(
          Place(
              name: p['name'],
              description: p['description'],
              location: p['location'],
              urlImage: p['urlImage'],
              likes: p['likes'],
              creationDate: p['creationDate']?.toDate()),
        ),
      );
    }
    return profilePlaces;
  }

  List<Place> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot, user_model.User user) {
    List<Place> places = [];

    for (var p in placesListSnapshot) {
      // Obtenemos los datos y convertimos correctamente los tipos
      var data = p.data() as Map<String, dynamic>;

      Place place = Place(
        id: p.id,
        name: data['name'],
        description: data['description'],
        location: data['location'],
        urlImage: data['urlImage'],
        likes: data['likes'] ?? 0,
        creationDate: (data['creationDate'] != null)
            ? (data['creationDate'] as Timestamp)
                .toDate() // Convertir Timestamp a DateTime
            : null,
      );

      List usersLikedRefs = p['usersLiked'];
      place.liked = false;
      for (var drUL in usersLikedRefs) {
        if (user.uid == drUL.id) {
          place.liked = true;
        }
      }
      places.add(place);
    }

    return Place.sortByCreationDate(places);
  }

  Future likePlace(Place place, String uid) async {
    await _db
        .collection(PLACES)
        .doc(place.id)
        .get()
        .then((DocumentSnapshot snapshot) {
      int likes = snapshot['likes'];

      _db.collection(USERS).doc(uid).update({
        'myFavoritePlaces': place.liked
            ? FieldValue.arrayUnion([_db.doc("$PLACES/${place.id}")])
            : FieldValue.arrayRemove([_db.doc("$PLACES/${place.id}")])
      });

      _db.collection(PLACES).doc(place.id).update({
        'likes': place.liked ? likes + 1 : likes - 1,
        'usersLiked': place.liked
            ? FieldValue.arrayUnion([_db.doc("$USERS/$uid")])
            : FieldValue.arrayRemove([_db.doc("$USERS/$uid")])
      });
    });
  }

  // Stream con un filtro que me permite obtener los places del usuario cuyo uid
  // paso como parámetro a dicho stream.
  Stream<QuerySnapshot> myPlacesListStream(String uid) => _db
      .collection(CloudFirestoreAPI().PLACES)
      .where("userOwner",
          isEqualTo: FirebaseFirestore.instance
              .doc("${CloudFirestoreAPI().USERS}/$uid"))
      .snapshots();

  Future<DocumentSnapshot> getPlace(String id) =>
      _db.collection(PLACES).doc(id).get();

  Future<DocumentSnapshot> myLastPlace(String uid) async {
    QuerySnapshot querySnapshot = await _db
        .collection(PLACES)
        .orderBy("creationDate")
        .where("userOwner",
            isEqualTo: _db.doc("${CloudFirestoreAPI().USERS}/$uid"))
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) return querySnapshot.docs.first;

    throw Exception('No se encontré nungún documento para este usuario.');
  }
}
