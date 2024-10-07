import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trip_app/Place/model/place.dart';
import 'package:platzi_trip_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzi_trip_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'package:platzi_trip_app/widgets/button_purple.dart';
import 'package:platzi_trip_app/widgets/gradient_back.dart';
import 'package:platzi_trip_app/widgets/text_input.dart';
import 'package:platzi_trip_app/widgets/title_header.dart';

// ignore: must_be_immutable
class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({super.key, required this.image});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final picker = ImagePicker();

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
                  pathImage: widget.image.path,
                  iconData: Icons.camera_alt,
                  iconColor: Colors.black54,
                  internet: false,
                  onPressedFabIcon: () {
                    picker
                        .pickImage(source: ImageSource.camera)
                        .then((XFile? image) {
                      if (image != null) {
                        setState(() {
                          widget.image = File(image.path);
                        });
                      }
                      // ignore: invalid_return_type_for_catch_error, avoid_print
                    }).catchError((onError) => print(onError));
                  },
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
                    // 1. Obtener el uid del usuario que esta logueado actualmente.
                    User? currentUser = userBloc.currentUser;
                    if (currentUser != null) {
                      String uid = currentUser.uid;

                      /// El path de la imagen a subir consta de: la carpeta es el uid del user logueado,
                      /// y el nombre del archivo se compone de la fecha en la cual se subio + .jpg como extensión.
                      String path = "$uid/${DateTime.now().toString()}.jpg";

                      // 2. Subimos la imagen a 'Firebase Storage': nos va a devolver una URL de la imagen.
                      userBloc
                          .uploadFile(path, widget.image)
                          .then((UploadTask storageUploadTask) {
                        // Obtenemos el TaskSnapshot cuando la subida se complete.
                        storageUploadTask.then((TaskSnapshot snapshot) async {
                          // Obtenemos la URL de la descarga de la imagen.
                          snapshot.ref.getDownloadURL().then((urlImage) {
                            // ignore: avoid_print
                            print("URLIMAGE: $urlImage");

                            /// 3. En Cloud Firestore vamos a insertar todo el objeto place con sus correspondientes
                            /// datos: { name*, description*, location*, urlImage*, userOwner, likes }
                            /// * = required
                            userBloc
                                .updatePlaceData(Place(
                              name: controllerTitlePlace.text,
                              description: controllerDescriptionPlace.text,
                              location: controllerLocationPlace.text,
                              urlImage: urlImage,
                            ))
                                .whenComplete(() {
                              // ignore: avoid_print
                              print("TERMINO");
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            });
                          }).catchError((error) =>
                              // ignore: avoid_print, invalid_return_type_for_catch_error
                              print("Error al obtener la URL: $error"));
                        }).catchError((error) =>
                            // ignore: avoid_print, invalid_return_type_for_catch_error
                            print("Error al subir el archivo: $error"));
                      });
                    }
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
