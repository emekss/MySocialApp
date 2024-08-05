import 'package:flutter/material.dart';
import 'package:social/themes/dark_mode.dart';
import 'package:social/themes/light_mode.dart';

/*
THEME PROVIDER

Helps us change app from light to dark mode. 

*/

class ThemeProvider with ChangeNotifier {
  //initially set as light mode
  ThemeData _themeData = lightMode;

  //get current theme
  ThemeData get themeData => _themeData;

  //is it dark mode currently
  bool get isDarkMode => _themeData == darkMode;

  //set the theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    // update UI
    notifyListeners();
  }

  // toggle between dark & light Mode
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
