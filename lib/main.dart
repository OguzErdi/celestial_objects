
import 'package:celestial_objects/celestical_obect_list.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Celestial Objects",
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      home: CelesticalObjectList(),
    );
  }
}