import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = TextThemeLight.init();
      return _instance!;
    }
  }

  TextThemeLight.init();

  TextTheme get textTheme => const TextTheme(
        //XX
        headline1: TextStyle(
          color: Color(0xff3C4854),
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
        headline2: TextStyle(
          //XX
          color: Color(0xff3C4854),
          fontSize: 30,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline3: TextStyle(
          //XX
          color: Color(0xff3C4854),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
        headline4: TextStyle(
          //XX
          color: Color(0xff3C4854),
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline5: TextStyle(
          //XX
          color: Color(0xff3C4854),
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline6: TextStyle(
          //XX
          color: Color(0xff3C4854),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle1: TextStyle(
          color: Color(0xff3C4854),
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText1: TextStyle(
          color: Color(0xff3C4854),
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText2: TextStyle(
          color: Color(0xff3C4854),
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        caption: TextStyle(
          color: Color(0xff3C4854),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        button: TextStyle(
          color: Color(0xff3C4854),
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle2: TextStyle(
          color: Color(0xff3C4854),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        overline: TextStyle(
          color: Color(0xff3C4854),
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      );
}
