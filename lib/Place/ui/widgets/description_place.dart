import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/Place/model/place.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'package:platzi_trip_app/widgets/button_purple.dart';

// ignore: must_be_immutable
class DescriptionPlace extends StatelessWidget {
  late UserBloc userBloc;

  DescriptionPlace({super.key});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    Widget titleStars(Place place) {
      return Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            margin: const EdgeInsets.only(top: 320.0, left: 20.0, right: 20.0),
            child: Text(
              place.name,
              style: const TextStyle(
                  fontFamily: "Lato",
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 320.0,
            ),
            child: Text(
              "Hearts: ${place.likes}",
              style: const TextStyle(
                  fontFamily: "Lato",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.amber),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );
    }

    Widget descriptionWidget(String descriptionPlace) {
      return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Text(
          descriptionPlace,
          style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF56575a)),
        ),
      );
    }

    return StreamBuilder(
        stream: userBloc.placeSelectedStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            Place place = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                titleStars(place),
                descriptionWidget(place.description),
                const ButtonPurple(buttonText: "Navigate")
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      top: 340.0, left: 20.0, right: 20.0),
                  child: const Text(
                    "Seleccione un lugar",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            );
          }
        });
  }
}
