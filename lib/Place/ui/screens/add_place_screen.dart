import 'dart:io';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/Place/model/place.dart';
import 'package:platzi_trip_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzi_trip_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'package:platzi_trip_app/widgets/button_purple.dart';
import 'package:platzi_trip_app/widgets/gradient_back.dart';
import 'package:platzi_trip_app/widgets/text_input.dart';
import 'package:platzi_trip_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  final File? image;

  const AddPlaceScreen({super.key, this.image});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    final controllerTitlePlace = TextEditingController();
    final controllerDescriptionPlace = TextEditingController();
    final controllerLocationPlace = TextEditingController();

    final backButtonNavigator = Container(
      padding: const EdgeInsets.only(top: 25.0, left: 5.0),
      child: SizedBox(
        height: 45.0,
        width: 45.0,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 45.0,
            )),
      ),
    );

    return Scaffold(
      body: Stack(children: <Widget>[
        GradientBack(height: 300.0),
        Row(children: <Widget>[
          // App Bar
          backButtonNavigator,
          const TitleHeader(title: "Add a new place")
        ]),
        Container(
          margin: const EdgeInsets.only(top: 120.0, bottom: 20.0),
          child: ListView(
            children: <Widget>[
              // Photo.
              Container(
                alignment: Alignment.center,
                child: CardImageWithFabIcon(
                  width: 350.0,
                  pathImage: widget.image!.path,
                  iconData: Icons.camera_alt,
                  fromCamera: true,
                ),
              ),
              // TextField Title
              Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextInput(
                  hintText: "Title",
                  controller: controllerTitlePlace,
                ),
              ),
              TextInput(
                hintText: "Description",
                inputType: TextInputType.multiline,
                controller: controllerDescriptionPlace,
                maxLines: 4,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: TextInputLocation(
                    hintText: "Add Location",
                    iconData: Icons.location_on,
                    controller: controllerLocationPlace),
              ),
              SizedBox(
                width: 70.0,
                child: ButtonPurple(
                  buttonText: "Add Place",
                  onPressed: () {
                    // 1. Subir la imagen al 'Firebase Storage': nos va a devolver una URL de la imagen.
                    // 2. En Cloud Firestore vamos a insertar todo el objeto place con
                    // sus correspondientes datos: { title, description, url, userOwner, likes }
                    userBloc
                        .updatePlaceData(Place(
                      name: controllerTitlePlace.text,
                      description: controllerDescriptionPlace.text,
                      location: controllerLocationPlace.text,
                      urlImage: widget.image!.path,
                      likes: 0,
                    ))
                        .whenComplete(() {
                      // ignore: avoid_print
                      print("TERMINO");
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    });
                  },
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
