import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'package:platzi_trip_app/User/ui/screens/sign_in_screen.dart';
import 'firebase_options.dart';
//import 'package:platzi_trip_app/platzi_trips.dart';
//import 'package:platzi_trip_app/widgets/platzi_trips_cupertino.dart';

/// Requires that a Firestore emulator is running locally.
/// See https://firebase.google.com/docs/firestore/quickstart#optional_prototype_and_test_with
bool shouldUserFirestoreEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  if (shouldUserFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SignInScreen(), //PlatziTrips(),
      ),
    );
  }
}
