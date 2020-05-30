import 'package:celestial_objects/celestical_obect_detail.dart';
import 'package:celestial_objects/celestical_obect_list.dart';
import 'package:celestial_objects/palette_generator_test.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/objectList",
      routes: {
        '/': (context) => CelesticalObjectList(),
        '/objectList': (context) => CelesticalObjectList(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathSectors = settings.name.split('/');
        var pageName = pathSectors[1];
        var index = int.parse(pathSectors[2]);

        if (pageName == 'objectDetail') {
          return MaterialPageRoute(
              builder: (context) => CelesticalObjectDetail(index));
        }

        return MaterialPageRoute(builder: (context) => CelesticalObjectList());
      },
      title: "Celestial Objects",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home: CelesticalObjectList(), //gerek kalmadı
    );
  }
}
