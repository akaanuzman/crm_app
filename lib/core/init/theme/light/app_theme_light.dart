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
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: colorSchemeLight.shamrock,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: _colorScheme.surface,
        unselectedLabelColor: colorSchemeLight.white,
      ),
      appBarTheme: AppBarTheme(color: colorSchemeLight.limedSpruce),
      scaffoldBackgroundColor: colorSchemeLight.athensGray);

  ColorScheme get _colorScheme => ColorScheme(
      primary: colorSchemeLight.black,
      primaryVariant: colorSchemeLight.mandy,
      secondary: colorSchemeLight.athensGray,
      secondaryVariant: colorSchemeLight.limedSpruce,
      surface: colorSchemeLight.doggerBlue, //xx
      background: Colors.grey.shade300, //xx
      error: colorSchemeLight.sun,
      onPrimary: colorSchemeLight.shamrock,
      onSecondary: Colors.black, //x
      onSurface: Colors.white,
      onBackground: Colors.grey,
      onError: colorSchemeLight.royalBlue, //xx
      brightness: Brightness.light);
}
