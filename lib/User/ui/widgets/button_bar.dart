import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';

// ignore: must_be_immutable
class ButtonsBar extends StatelessWidget {
  late UserBloc userBloc;

  ButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            CircleButton(true, Icons.turned_in_not, 20.0,
                const Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            CircleButton(true, Icons.vpn_key, 20.0,
                const Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            CircleButton(
                false, Icons.add, 40.0, const Color.fromRGBO(255, 255, 255, 1),
                () {
              // TODO: Revisar esta imagen, no es la correcta.
              File image = File("assets/images/luffy.jpg");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AddPlaceScreen(image: image)));
            }),
            CircleButton(true, Icons.mail_outline, 20.0,
                const Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            CircleButton(true, Icons.person, 20.0,
                const Color.fromRGBO(255, 255, 255, 0.6), () => {})
          ],
        ));
  }
}
