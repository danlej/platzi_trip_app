import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/User/repository/auth_repository.dart';
import 'package:platzi_trip_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trip_app/User/model/user.dart' as user_model;

class UserBloc implements Bloc {
  final authRepository = AuthRepository();

  // Flujo de datos Streams: Firebase ya viene con métodos que nos devuelven
  // el flujo de datos y nosotros decidimos que hacer con ese stream.
  // Si no tuvieramos ese flujo de datos utilizariamos la clase StreamController.
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  // 1er Caso de uso de la clase User: SignIn a la aplicación Google.
  Future<User?> signIn() {
    return authRepository.signInFirebase();
  }

  // 2do Caso de uso de la clase User: SignOut de la aplicación Google.
  Future<void> signOut() async {
    authRepository.signOutFirebase();
  }

  // 3er Caso de uso de la clase User: Registrar usuario en base de datos.
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(user_model.User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  void checkCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // ignore: avoid_print
      print("Usuario autenticado: ${user.displayName}");
    } else {
      // ignore: avoid_print
      print("No hay usuario autenticado");
    }
  }

  @override
  void dispose() {}
}
