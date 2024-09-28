import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/Place/ui/screens/home_trips.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'package:platzi_trip_app/User/ui/screens/profile_trips.dart';
import 'package:platzi_trip_app/Place/ui/screens/search_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {
  const PlatziTripsCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
              backgroundColor: Colors.white.withAlpha(70),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.indigo), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: Colors.indigo), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Colors.indigo), label: "")
              ]),
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => const HomeTrips(),
                );
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => const SearchTrips(),
                );
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return BlocProvider<UserBloc>(
                        bloc: UserBloc(), child: const ProfileTrips());
                  },
                );
              default:
                return CupertinoTabView(
                  builder: (BuildContext context) => const HomeTrips(),
                );
            }
          }),
    );
  }
}
