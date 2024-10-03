import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';

// ignore: must_be_immutable
class CardImageList extends StatelessWidget {
  late UserBloc userBloc;

  CardImageList({super.key});

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
                case ConnectionState.done:
                default:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs));
              }
            }));
  }

  Widget listViewPlaces(List<CardImageWithFabIcon> placesCard) {
    return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    );
  }
}
