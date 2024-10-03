import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'package:platzi_trip_app/User/model/user.dart';
import 'package:platzi_trip_app/User/ui/widgets/profile_background.dart';
import 'package:platzi_trip_app/User/ui/screens/profile_header.dart';
import 'package:platzi_trip_app/User/ui/widgets/profile_places_list.dart';

// ignore: must_be_immutable
class ProfileTrips extends StatelessWidget {
  late UserBloc userBloc;

  ProfileTrips({super.key});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
            default:
              return showProfileData(snapshot);
          }
        });
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      // ignore: avoid_print
      print("No logueado");
      return Stack(children: <Widget>[
        const ProfileBackground(),
        Container(
            margin: const EdgeInsets.only(top: 300.0),
            child: ListView(
                padding: const EdgeInsets.only(top: 10.0),
                children: const <Widget>[
                  Text("Usuario no logueado. Haz login")
                ]))
      ]);
    } else {
      // ignore: avoid_print
      print("Usuario Logueado");
      var user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);

      return Stack(
        children: <Widget>[
          const ProfileBackground(),
          ProfileHeader(user: user),
          // El contenedor a continuación crea un área segura para el ListView y hace que
          // el ListView de 'Places' pase detrás de la sección 'ProfileHeader'
          // dando un efecto de quedar estática y dejando los datos de perfil siempre visibles.
          Container(
            // Este margen es para NO tapar la sección de 'Profile' con el ListView.
            margin: const EdgeInsets.only(top: 300.0),
            child: ListView(
              padding: const EdgeInsets.only(top: 10.0),
              children: <Widget>[ProfilePlacesList(user: user)],
            ),
          )
        ],
      );
    }
  }
}
