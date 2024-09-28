import 'package:flutter/material.dart';
import 'package:platzi_trip_app/User/ui/widgets/profile_background.dart';
import 'package:platzi_trip_app/User/ui/screens/profile_header.dart';
import 'package:platzi_trip_app/User/ui/widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {
  const ProfileTrips({super.key});

  @override
  Widget build(BuildContext context) {
    //return const ProfileHeaderAppbar();
    return Stack(
      children: <Widget>[
        const ProfileBackground(),
        ProfileHeader(),
        // Este contenedor hace que el ListView de 'Places' pase detrás de la sección
        // de 'Profile' dando ese efecto de quedar estática y siempre visible.
        Container(
          // Este margen es para NO tapar la sección de 'Profile' con el ListView.
          margin: const EdgeInsets.only(top: 300.0),
          child: ListView(
            padding: const EdgeInsets.only(top: 10.0),
            children: <Widget>[ProfilePlacesList()],
          ),
        ),
      ],
    );
  }
}
