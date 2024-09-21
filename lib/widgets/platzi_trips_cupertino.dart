import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platzi_trip_app/widgets/home_trips.dart';
import 'package:platzi_trip_app/widgets/profile_trips.dart';
import 'package:platzi_trip_app/widgets/search_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {
  const PlatziTripsCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
              backgroundColor: Colors.white.withAlpha(70),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
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
                  builder: (BuildContext context) => const ProfileTrips(),
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
