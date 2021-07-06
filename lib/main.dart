import 'feature/bottomtab/view/bottomtab_view.dart';
import 'feature/splash/view/splash_view.dart';

import 'core/init/theme/light/app_theme_light.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:kartal/kartal.dart';

main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeLight.instance.themeDataLight,
        home: const SplashView());
  }
}
