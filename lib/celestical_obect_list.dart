import 'package:celestial_objects/models/celestial_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/planet.dart';
import 'utils/strings.dart';

class CelesticalObjectList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Planet> planets = getPlanetData();

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.APP_NAME),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: generateCelestialObjectList(planets),
    );
  }

  List<Planet> getPlanetData() {
    List<Planet> planets = [];

    for (var i = 0; i < Strings.PLANETS.length; i++) {
      var planet = Planet(
        Strings.PLANETS[i],
        Strings.PLANETS_DETAILS[i],
        Strings.PLANETS_AGE[i],
        "images/planets/icons/" + Strings.PLANETS[i].toLowerCase() + ".png",
        "images/planets/icons/" + Strings.PLANETS[i].toLowerCase() + ".png",
      );
      debugPrint("images/planets/icons/" + Strings.PLANETS[i].toLowerCase() + ".png");
      planets.add(planet);
    }

    return planets;
  }

  Widget generateCelestialObjectList(
      List<CelestialObject> celestialObjectList) {
    return ListView.builder(
        itemCount: celestialObjectList.length,
        itemBuilder: (context, index) {
          return listItemCelestialObject(context, celestialObjectList[index]);
        });
  }

  Widget listItemCelestialObject(context, CelestialObject celestialObject) {
    return Card(
      elevation: 4,
      color: Colors.indigo.shade900,
      child: ListTile(
        leading: Image.asset(
          celestialObject.icon,
          width: 64,
          height: 64,
        ),
        title: Text(
          celestialObject.name,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
        subtitle: Text(
          celestialObject.age,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white60),
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
