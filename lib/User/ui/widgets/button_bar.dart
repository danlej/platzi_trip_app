import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
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
    final picker = ImagePicker();

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
              picker.pickImage(source: ImageSource.camera).then((XFile? image) {
                if (image != null) {
                  Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              AddPlaceScreen(image: File(image.path))));
                }
              })
                  // ignore: invalid_return_type_for_catch_error, avoid_print
                  .catchError((onError) => print(onError));
            }),
            CircleButton(true, Icons.mail_outline, 20.0,
                const Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            CircleButton(true, Icons.person, 20.0,
                const Color.fromRGBO(255, 255, 255, 0.6), () => {})
          ],
        ));
  }
}
