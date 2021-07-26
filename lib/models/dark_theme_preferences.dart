import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const THEME_STATUS = "THEME_STATUS";
  setDarkTheme(bool value) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.getBool(THEME_STATUS) ?? false;
  }
}