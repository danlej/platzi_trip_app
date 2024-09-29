import 'package:flutter/material.dart';
import 'package:platzi_trip_app/User/model/user.dart' as user_model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'package:platzi_trip_app/platzi_trips.dart';
import 'package:platzi_trip_app/widgets/button_green.dart';
import 'package:platzi_trip_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // snapshot - data - Object User
          if ((!snapshot.hasData || snapshot.hasError)) {
            return signInGoogleUI();
          } else {
            return const PlatziTrips();
          }
        });
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Welcome \n This is your Travel App.",
                style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              ButtonGreen(
                  text: "Login with Gmail",
                  onPressed: () {
                    //userBloc.signOut();
                    userBloc.signIn().then((User? user) {
                      if (user != null) {
                        userBloc.updateUserData(user_model.User(
                            uid: user.uid,
                            name: user.displayName ?? "",
                            email: user.email ?? "",
                            photoURL: user.photoURL ?? "",
                            myPlaces: null,
                            myFavoritePlaces: null));
                      }
                    });
                  },
                  width: 300.0,
                  height: 50.0)
            ],
          )
        ],
      ),
    );
  }
}
