import 'package:celestial_objects/utils/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/planet.dart';

class CelesticalObjectDetail extends StatelessWidget {
  int index;
  Planet planet;

  CelesticalObjectDetail(this.index);

  @override
  Widget build(BuildContext context) {
    planet = Repository().planets[index];

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 500,
            pinned: true,
            primary: true,
            backgroundColor: Colors.orange,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                planet.picture,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              centerTitle: true,
            ),
            title: Text(planet.name),
          ),
          //her widgetı slivera çeviren bir adaptor.
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.black,
                child: Text(planet.detail,
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
