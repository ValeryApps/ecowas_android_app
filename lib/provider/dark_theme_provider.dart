import 'package:ecowas24/models/dark_theme_preferences.dart';
import 'package:flutter/material.dart';


class DarkThemProvider with ChangeNotifier {
  DarkThemePreferences themePreferences = DarkThemePreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _darkTheme = value;
    themePreferences.setDarkTheme(value);
    notifyListeners();
  }
}
