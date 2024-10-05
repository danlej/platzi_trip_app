import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/Place/model/place.dart';
import 'package:platzi_trip_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'package:platzi_trip_app/User/model/user.dart';

// ignore: must_be_immutable
class CardImageList extends StatefulWidget {
  User user;

  CardImageList({super.key, required this.user});

  @override
  State<StatefulWidget> createState() {
    return _CardImageListState();
  }
}

class _CardImageListState extends State<CardImageList> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return SizedBox(
        height: 350.0,
        child: StreamBuilder(
            stream: userBloc.placesStream,
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                  // ignore: avoid_print
                  print("PLACESLIST: ACTIVE");
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs, widget.user));
                case ConnectionState.done:
                  // ignore: avoid_print
                  print("PLACESLIST: DONE");
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs, widget.user));
                default:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs, widget.user));
              }
            }));
  }

  Widget listViewPlaces(List places) {
    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
      });
    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place) {
        return CardImageWithFabIcon(
          pathImage: place.urlImage,
          iconData: place.liked ? iconDataLiked : iconDataLike,
          onPressedFabIcon: () => setLiked(place),
          left: 20.0,
        );
      }).toList(),
    );

    /* return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    ); */
  }
}
