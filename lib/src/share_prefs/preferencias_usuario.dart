import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get getGenero {
    return _prefs.getInt('genero') ?? 1;
  }

  set setGenero(int value) {
    _prefs.setInt('genero', value);
  }

  get getNombre {
    return _prefs.getString('nombre') ?? '';
  }

  set setNombre(String nombre) {
    _prefs.setString('nombre', nombre);
  }

  get getColorSecundario {
    return _prefs.getBool('color') ?? false;
  }

  set setColorSecundario(bool color) {
    _prefs.setBool('color', color);
  }

  get getCurrentScreen {
    return _prefs.getString('screen') ?? 'home';
  }

  set setCurrentScreen(String value) {
    _prefs.setString('screen', value);
  }

  //late bool _colorSecundario;
  //late int _genero;
  //late String _nombre;
}
