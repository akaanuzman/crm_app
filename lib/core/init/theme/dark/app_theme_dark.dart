import 'package:crm_app/core/init/theme/iapp_theme.dart';
import 'package:flutter/material.dart';

class AppThemeDark extends IAppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppThemeDark.init();
      return _instance!;
    }
  }

  AppThemeDark.init();

  @override
  ThemeData get themeDataDark => ThemeData.dark().copyWith();
}
