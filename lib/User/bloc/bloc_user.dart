import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final authRepository = AuthRepository();

  // 1er Caso de uso de la clase User: SignIn a la aplicación Google.
  Future<User?> signIn() {
    return authRepository.signInFirebase();
  }

  @override
  void dispose() {}
}
