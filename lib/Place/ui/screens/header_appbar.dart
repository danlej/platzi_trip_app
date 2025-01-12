import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'package:platzi_trip_app/User/model/user.dart';
import 'package:platzi_trip_app/widgets/gradient_back.dart';
import 'package:platzi_trip_app/Place/ui/widgets/card_image_list.dart';

// ignore: must_be_immutable
class HeaderAppBar extends StatelessWidget {
  late UserBloc userBloc;

  HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              return showPlacesData(snapshot);
          }
        });

    /* return Stack(
      children: <Widget>[
        // GradientBack(title: "Bienvenido!", height: 250.0),
        GradientBack(height: 250.0),
        CardImageList()
      ],
    ); */
  }

  Widget showPlacesData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: <Widget>[
          GradientBack(height: 250.0),
          const Text("Usuario no logueado. Has login"),
        ],
      );
    } else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);

      return Stack(
        children: [
          GradientBack(height: 250.0),
          CardImageList(
            user: user,
          )
        ],
      );
    }
  }
}
