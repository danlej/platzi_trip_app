import 'package:flutter/material.dart';
import 'package:platzi_trip_app/User/ui/widgets/logout_button.dart';
import 'package:platzi_trip_app/User/ui/widgets/user_info.dart';
import 'package:platzi_trip_app/User/ui/widgets/button_bar.dart';
import 'package:platzi_trip_app/User/model/user.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatelessWidget {
  User user;

  ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    const title = Text(
      'Profile',
      style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0),
    );

    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: Column(
        children: <Widget>[
          const Row(
            children: <Widget>[
              title,
              Spacer(
                flex: 3,
              ),
              LogoutButton(),
            ],
          ),
          UserInfo(user: user),
          ButtonsBar()
        ],
      ),
    );
  }
}

/* Widget showProfileData(AsyncSnapshot snapshot) {
  User user;
  // snapshot contiene la data traida desde el stream.
  if (!snapshot.hasData || snapshot.hasError) {
    // ignore: avoid_print
    print("No logueado");
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: const Column(
        children: <Widget>[
          CircularProgressIndicator(),
          Text("No se pudo cargar la información. Haz login")
        ],
      ),
    );
  } else {
    // ignore: avoid_print
    print("Logueado");
    // ignore: avoid_print
    print(snapshot.data);

    user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoURL,
        myPlaces: snapshot.data.myPlaces,
        myFavoritePlaces: snapshot.data.myFavoritePlaces);

    const title = Text(
      'Profile',
      style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0),
    );

    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: Column(
        children: <Widget>[
          const Row(
            children: <Widget>[
              title,
              Spacer(
                flex: 3,
              ),
              LogoutButton(),
            ],
          ),
          UserInfo(user: user),
          ButtonsBar()
        ],
      ),
    );
  }
} */
