import 'package:shared_preferences/shared_preferences.dart';

class SettingsUser {
  static final SettingsUser _instance = new SettingsUser._internal();

  factory SettingsUser() {
    return _instance;
  }

  SettingsUser._internal();

  SharedPreferences _preferences;

  init() async {
    this._preferences = await SharedPreferences.getInstance();
  }

  int get genre {
    return _preferences.getInt('genre') ?? 1;
  }

  set genre(int genre) {
    _preferences.setInt('genre', genre);
  }

  bool get secondaryColor {
    return _preferences.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool secondaryColor) {
    _preferences.setBool('secondaryColor', secondaryColor);
  }

  String get name {
    return _preferences.getString('name') ?? 'anonimus';
  }

  set name(String name) {
    _preferences.setString('name', name);
  }
}
