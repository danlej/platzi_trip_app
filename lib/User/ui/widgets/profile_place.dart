import 'package:flutter/material.dart';
import 'package:platzi_trip_app/Place/model/place.dart';
import 'profile_place_info.dart';

// ignore: must_be_immutable
class ProfilePlace extends StatelessWidget {
  Place place;

  ProfilePlace(this.place, {super.key});

  @override
  Widget build(BuildContext context) {
    final photoCard = Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 70.0),
      height: 220.0,
      decoration: const BoxDecoration(
          /* image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(place.urlImage),
          ), */
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.blueGrey,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0))
          ]),
      // Agrego la imagen de esta manera para hacer que muestre el CircularProgressIndicator
      // mientras carga la imagen, evitando mostrar el color de fondo del Container
      // si la carga tarda un rato.
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              place.urlImage,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                    child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ));
              },
            ),
          )),
    );

    return Stack(
      alignment: const Alignment(0.0, 0.8),
      children: <Widget>[photoCard, ProfilePlaceInfo(place)],
    );
  }
}
