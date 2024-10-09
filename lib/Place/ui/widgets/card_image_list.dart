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
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    // Inicializamos userBloc en didChangeDependencies para obtener context
    userBloc = BlocProvider.of<UserBloc>(context);

    // Agregar el lugar por defecto
    userBloc.myLastPlace(userBloc.currentUser!.uid).then((Place place) {
      // ignore: avoid_print
      print("LAST PLACE: ${place.name}");
      userBloc.placeSelectedSink.add(place);
    });

    /* Place(
      name: 'Duwili Ella',
      description: loremIpsum(50),
      location: 'Netherland',
      urlImage:
          'https://firebasestorage.googleapis.com/v0/b/platzitripsflutter-ae73d.appspot.com/o/RTtmBPbTuCQhmpcofhtdEYpDtvC2%2F2024-10-07%2014%3A44%3A07.496510.jpg?alt=media&token=a1e298b8-0121-452c-ad84-2a92604dc326',
      likes: 5,
    ) */
  }

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

  Widget listViewPlaces(List<Place> places) {
    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
        place.likes = place.liked ? place.likes + 1 : place.likes - 1;
        userBloc.placeSelectedSink.add(place);
      });
    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place) {
        return GestureDetector(
          onTap: () {
            // ignore: avoid_print
            print("CLICK PLACE: ${place.name}");
            userBloc.placeSelectedSink.add(place);
          },
          child: CardImageWithFabIcon(
            pathImage: place.urlImage,
            iconData: place.liked ? iconDataLiked : iconDataLike,
            iconColor: place.liked ? Colors.red : Colors.black54,
            onPressedFabIcon: () => setLiked(place),
            left: 20.0,
          ),
        );
      }).toList(),
    );
  }
}
