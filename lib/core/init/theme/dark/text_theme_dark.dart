import 'package:flutter/material.dart';

class TextThemeDark {
  static TextThemeDark? _instance;
  static TextThemeDark get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = TextThemeDark.init();
      return _instance!;
    }
  }

  TextThemeDark.init();
  TextTheme get textTheme => const TextTheme(
        //XX
        headline1: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
        headline2: TextStyle(
          //XX
          color: Color(0xfffafafa),
          fontSize: 30,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline3: TextStyle(
          //XX
          color: Color(0xfffafafa),
          fontSize: 25,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline4: TextStyle(
          //XX
          color: Color(0xfffafafa),
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline5: TextStyle(
          //XX
          color: Color(0xfffafafa),
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline6: TextStyle(
          //XX
          color: Color(0xfffafafa),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle1: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText1: TextStyle(
          color: Color(0xfffafafa),
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText2: TextStyle(
          color: Color(0xffffffff),
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        caption: TextStyle(
          color: Color(0xb3ffffff),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        button: TextStyle(
          color: Color(0xffffffff),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle2: TextStyle(
          color: Color(0xffffffff),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        overline: TextStyle(
          color: Color(0xffffffff),
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      );
}
