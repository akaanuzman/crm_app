import 'package:flutter/material.dart';

import '../iapp_theme.dart';
import 'ilight_theme.dart';

class AppThemeLight extends IAppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppThemeLight.init();
      return _instance!;
    }
  }

  AppThemeLight.init();

  @override
  ThemeData get themeDataLight => ThemeData.light().copyWith(
        colorScheme: _colorScheme,
        textTheme: textThemeLight.textTheme,
  
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: colorSchemeLight.white,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: colorSchemeLight.athensGray,
          elevation: 0
        ),

        appBarTheme: AppBarTheme(
          color: colorSchemeLight.carnation,
          titleTextStyle: const TextStyle(fontSize: 18),
        ),
        scaffoldBackgroundColor: colorSchemeLight.athensGray,
      );

  ColorScheme get _colorScheme => ColorScheme(
      primary: colorSchemeLight.black,
      primaryVariant: colorSchemeLight.mandy,
      secondary: colorSchemeLight.athensGray,
      secondaryVariant: colorSchemeLight.limedSpruce,
      surface: colorSchemeLight.doggerBlue, //xxß
      background: colorSchemeLight.finn, //xx
      error: colorSchemeLight.sun,
      onPrimary: colorSchemeLight.shamrock,
      onSecondary: Colors.black, //x
      onSurface: Colors.white,
      onBackground: colorSchemeLight.carnation,
      onError: colorSchemeLight.royalBlue, //xx
      brightness: Brightness.light);
}
