import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crm_app/feature/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: context.colorScheme.secondaryVariant,
      splash: Image.network(
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.logo.com.tr%2F&psig=AOvVaw0kZuXlQCwqIQ_n65KyIQ-O&ust=1628293175166000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCJiy2_OGm_ICFQAAAAAdAAAAABAJ",
      ),
      nextScreen: LoginView(),
      duration: 1000,
    );
  }
}
