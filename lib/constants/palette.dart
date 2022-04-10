import 'package:flutter/material.dart';

// Applications Palette
class Palette {
  Palette._();

  //
  static const Map<int, Color> _primaryColorSwatch = {
    50: Color.fromRGBO(92, 197, 96, .1),
    100: Color.fromRGBO(92, 197, 96, .2),
    200: Color.fromRGBO(92, 197, 96, .3),
    300: Color.fromRGBO(92, 197, 96, .4),
    400: Color.fromRGBO(92, 197, 96, .5),
    500: Color.fromRGBO(92, 197, 96, .6),
    600: Color.fromRGBO(92, 197, 96, .7),
    700: Color.fromRGBO(92, 197, 96, .8),
    800: Color.fromRGBO(92, 197, 96, .9),
    900: Color.fromRGBO(92, 197, 96, 1),
  };

  //
  static const MaterialColor primaryColor =
      MaterialColor(0xFF5cc560, _primaryColorSwatch);

  //
  static const Color inputBorderColor = Color(0xFFF1F1F1);

  //
  static const Color buttonOverlayColor = Color.fromRGBO(0, 0, 0, 0.05);

  //
  static const Map<int, Color> blackColorSwatch = {
    50: Color.fromRGBO(42, 42, 42, .1),
    100: Color.fromRGBO(42, 42, 42, .2),
    200: Color.fromRGBO(42, 42, 42, .3),
    300: Color.fromRGBO(42, 42, 42, .4),
    400: Color.fromRGBO(42, 42, 42, .5),
    500: Color.fromRGBO(42, 42, 42, .6),
    600: Color.fromRGBO(42, 42, 42, .7),
    700: Color.fromRGBO(42, 42, 42, .8),
    800: Color.fromRGBO(42, 42, 42, .9),
    900: Color.fromRGBO(42, 42, 42, 1),
  };

  //
  static const MaterialColor blackColor =
      MaterialColor(0xff2A2A2A, blackColorSwatch);

  //
  static const Color borderColor = Color(0xFFD9D9D9);

  //
  static const Color inputHintColor = Color.fromRGBO(94, 94, 94, 1);

  //
  static const Color shadowColor = Color(0xFFE5E5E5);

  //
  static const Color scaffoldBackgroundColor = Color(0xFFececf7);

  //
  static const Color progressColor = Color(0xFFc4c4c4);

  //
  static const Color greenColor = Color(0xFF60bd9b);

  //
  static const Color darkGreenColor = Color(0xFF15c785);

  //
  static const Color redColor = Color(0xFFfe1846);
}
