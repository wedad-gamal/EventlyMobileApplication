import 'package:evently_app/core/utilites/shared_preferences_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode themeMode) async{
    if(this.themeMode == themeMode) return;
    this.themeMode = themeMode;
    notifyListeners();
    var pref = await SharedPreferences.getInstance();
    pref.setBool(SharedPreferencesKeys.isDark.value, isDark);
  }

  bool get isDark=> themeMode == ThemeMode.dark;

  String local= "en";
  void changeLocal(String local)async{
    if(this.local == local) return;
    this.local = local;
    notifyListeners();
    var pref = await SharedPreferences.getInstance();
    pref.setString(SharedPreferencesKeys.local.value, local);
  }
  bool get isEnglish=> local == "en";
}

