import 'package:celestial_objects/utils/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'models/planet.dart';

class CelesticalObjectDetail extends StatefulWidget {
  int index;

  CelesticalObjectDetail(this.index);

  @override
  _CelesticalObjectDetailState createState() => _CelesticalObjectDetailState();
}

class _CelesticalObjectDetailState extends State<CelesticalObjectDetail> {
  Planet planet;
  PaletteGenerator paletteGenerator;
  Color pimaryColor;
  Color backgroundColor;

  @override
  void initState() {
    super.initState();
    
    planet = Repository().planets[widget.index];
    getDominantColor();
  }

  void getDominantColor() {
    Future<PaletteGenerator> fPaletteGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage(planet.picture)); //future, async call gibi

    fPaletteGenerator.then((value) {
      paletteGenerator = value;
      debugPrint("Seçilen Primary Color: ${paletteGenerator.vibrantColor.color.toString()}");
      debugPrint("Seçilen Bakcground Color: ${paletteGenerator.darkVibrantColor.color.toString()}");

      // burda, yeni renk ile ekranı tekrar çizmen lazım
      setState(() {
        pimaryColor = paletteGenerator.vibrantColor.color;
        backgroundColor = paletteGenerator.darkVibrantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            primary: true,
            backgroundColor: pimaryColor ?? Colors.pink,
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
              color: pimaryColor ?? Colors.pink,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  color: backgroundColor ?? Colors.pink,
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
