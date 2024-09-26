import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final authRepository = AuthRepository();

  // FLujo de datos Streams: Firebase ya viene con métodos que nos devuelven
  // el flujo de datos y nosotros decidimos que hacer con ese stream.
  // Si no tuvieramos ese flujo de datos utilizariamos la clase StreamController.
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  // 1er Caso de uso de la clase User: SignIn a la aplicación Google.
  Future<User?> signIn() {
    return authRepository.signInFirebase();
  }

  @override
  void dispose() {}
}
