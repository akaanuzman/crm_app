import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = ColorSchemeLight.init();
      return _instance!;
    }
  }

  ColorSchemeLight.init();

  final Color brown = const Color(0xffa87e6f);
  final Color white = const Color(0xffffffff);
  final Color athensGray = const Color(0xffF5F6F9);
  final Color lightGray = const Color(0xfff7f7f7);
  final Color darkGray = const Color(0xff676870);
  final Color black = const Color(0xff020306);
  final Color azure = const Color(0xff27928d);
  final Color blackSqueeze = const Color(0xffF6F9FC);
  final Color sun = const Color(0xffF9B916);
  final Color limedSpruce = const Color(0xff3C4854);
  final Color shamrock = const Color(0xff44CF9C);
  final Color doggerBlue = const Color(0xff3283F6);
  final Color mandy = const Color(0xffE95C5C);
  final Color whisper = const Color(0xffF4F5F9);

}
