import 'feature/splash/view/splash_view.dart';

import 'core/init/theme/light/app_theme_light.dart';
import 'package:flutter/material.dart';

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
