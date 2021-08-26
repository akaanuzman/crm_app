import 'package:flutter/material.dart';

import 'core/init/theme/light/app_theme_light.dart';
import 'feature/auth/login/view/login_view.dart';

// arama sms ve şirket içi mesajlaşma
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
        home: const LoginView());
  }
}
