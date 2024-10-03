import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trip_app/User/bloc/bloc_user.dart';
import 'package:platzi_trip_app/User/ui/screens/profile_trips.dart';
import 'package:platzi_trip_app/Place/ui/screens/search_trips.dart';
import 'package:platzi_trip_app/Place/ui/screens/home_trips.dart';

class PlatziTrips extends StatefulWidget {
  const PlatziTrips({super.key});

  @override
  State<PlatziTrips> createState() => _PlatziTripsState();
}

class _PlatziTripsState extends State<PlatziTrips> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    const HomeTrips(),
    const SearchTrips(),
    ProfileTrips()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: widgetsChildren[indexTap],
      body: BlocProvider<UserBloc>(
        bloc: UserBloc(),
        child: widgetsChildren[indexTap],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
        child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 28.0,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 28.0,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 28.0,
                  ),
                  label: "")
            ]),
      ),
    );
  }
}
