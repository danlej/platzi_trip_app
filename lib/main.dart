import 'package:flutter/material.dart';
import 'package:platzi_trip_app/widgets/platzi_trips.dart';
//import 'package:platzi_trip_app/widgets/platzi_trips_cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const PlatziTrips(),
      /* home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "My Test Widget",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.black87,
            actions: const <Widget>[
              Icon(
                Icons.search,
                color: Colors.white70,
              ),
              Icon(
                Icons.camera,
                color: Colors.white70,
              ),
              Icon(
                Icons.person,
                color: Colors.white70,
              )
            ],
          ),
          body: const MyTestWidget()), */
    );
  }
}
