import 'package:animated_splash_screen/animated_splash_screen.dart';
import '../../auth/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: context.colorScheme.secondaryVariant,
      splash: Image.network(
        "http://192.168.3.53/assets/images/logo-light.png",
      ),
      nextScreen: const LoginView(),
      duration: 1000,
    );
  }
}
