import 'package:celestial_objects/utils/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'models/planet.dart';

class CelesticalObjectDetail extends StatelessWidget {
  int index;
  Planet planet;

  CelesticalObjectDetail(this.index);

  @override
  Widget build(BuildContext context) {
    planet = Repository().planets[index];
    PaletteGenerator paletteGenerator;

    Future<PaletteGenerator> fPaletteGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage(planet.picture)); //future, async call gibi

    fPaletteGenerator.then((value) {
      paletteGenerator = value;
      debugPrint("Seçilen Renl: ${paletteGenerator.dominantColor.color.toString()}");
    });

    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 600,
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
              title: Text(planet.name),
            ),
          ),
          //her widgetı slivera çeviren bir adaptor.
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(2.0),
              color: Colors.orange,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.black,
                  child: Text(planet.detail,
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
