abstract class CelestialObject {
  
  int _index; //or id
  String _name;
  String _detail;
  String _age;
  String _icon;
  String _picture;

  CelestialObject(
    this._index,
    this._name,
    this._detail,
    this._age,
    this._icon,
    this._picture,
  );

  int get index => _index;
  set index(value) => _index = value;

  String get name => _name;
  set name(value) => _name = value;

  String get detail => _detail;
  set detail(value) => _detail = value;

  String get age => _age;
  set age(value) => _age = value;

  String get icon => _icon;
  set icon(value) => _icon = value;

  String get picture => _picture;
  set picture(value) => _picture = value;
} 
