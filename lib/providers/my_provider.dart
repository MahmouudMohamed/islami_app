import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{

  ThemeMode mode = ThemeMode.light;

  ChangeTheme(ThemeMode themeMode){
    mode=themeMode;
    notifyListeners();
  }

}