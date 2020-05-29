import 'package:celestial_objects/models/planet.dart';
import 'package:celestial_objects/utils/strings.dart';

//singleton pattern
class Repository {
  static final Repository _repository = Repository._privateConstructor();
  List<Planet> _planets;

  factory Repository() {
    return _repository;
  }

  Repository._privateConstructor(){
    _planets = getPlanetData();
  }

  List<Planet> get planets => _planets;

  List<Planet> getPlanetData() {
    List<Planet> planets = [];

    for (var i = 0; i < Strings.PLANETS.length; i++) {
      var planet = Planet(
        i,
        Strings.PLANETS[i],
        Strings.PLANETS_DETAILS[i],
        Strings.PLANETS_AGE[i],
        "images/planets/icons/" + Strings.PLANETS[i].toLowerCase() + ".png",
        "images/planets/pictures/" + Strings.PLANETS[i].toLowerCase() + ".jpg",
      );

      planets.add(planet);
    }

    return planets;
  }
}
