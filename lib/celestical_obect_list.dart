import 'package:celestial_objects/models/celestial_object.dart';
import 'package:celestial_objects/utils/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/planet.dart';
import 'utils/strings.dart';

class CelesticalObjectList extends StatelessWidget {
  static List<Planet> planets;

  @override
  Widget build(BuildContext context) {
    List<Planet> planets = Repository().planets;

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.APP_NAME),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: generateCelestialObjectList(planets),
    );
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
      color: Colors.blueGrey[900],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/objectDetail/${celestialObject.index}"),
          // üsttek ile aynı işi yapacak.
          // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CelesticalObjectDetail(index))),
          leading: Image.asset(
            celestialObject.icon,
            width: 100,
            height: 150,
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
      ),
    );
  }
}
