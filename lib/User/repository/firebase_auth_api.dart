import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signIn() async {
    try {
      // Paso 1: Inicia sesión en Google
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        // Si el usuario cancela el inicio de sesión, se devuelve null
        return null;
      }

      // Paso 2: Autenticar la cuenta de Google
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // Paso 3: Obtener las credenciales de Google para Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Paso: Inicia sesión en Firebase con las credenciales de Google
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      return user;
    } catch (e) {
      // Manejo de errores si la autenticación falla
      if (kDebugMode) {
        print("Error al iniciar sesión con Google: $e");
      }
      return null;
    }
  }

  Future<void> signOut() async {
    // Cierra sesión en Google y Firebase
    await googleSignIn
        .signOut()
        // ignore: avoid_print
        .then((onValue) => print("Sesión de Google cerrada"));
    await _auth
        .signOut()
        // ignore: avoid_print
        .then((onValue) => print("Sesión de Firebase cerrada"));
  }
}
