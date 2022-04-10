import 'package:azelpo/constants/app_constants.dart';
import 'package:azelpo/constants/palette.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  // TextScaleFactor
  static const double textScaleFactor = 1.0;

  // App theme data
  static ThemeData theme() {
    return ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: PageTransition(),
      }),
      primarySwatch: Palette.primaryColor,
      fontFamily: kFontFamily,
      scaffoldBackgroundColor: Palette.scaffoldBackgroundColor,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all<Color>(Palette.buttonOverlayColor),
        ),
      ),
      iconTheme: IconThemeData(
        color: Palette.blackColor.shade500,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Palette.primaryColor,
        titleSpacing: 10,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 5,
        selectedLabelStyle: const TextStyle(
          height: textScaleFactor,
          fontSize: 14,
          color: Palette.blackColor,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          height: textScaleFactor,
          fontSize: 14,
          color: Palette.blackColor.shade500,
          fontWeight: FontWeight.bold,
        ),
        showSelectedLabels: true,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
        ),
        bodyText2: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
        ),
        button: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
        ),
        caption: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
        ),
        headline1: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        headline2: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        headline3: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        headline4: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        headline5: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        headline6: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        overline: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
        ),
        subtitle1: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
        ),
        subtitle2: TextStyle(
          height: textScaleFactor,
          color: Palette.blackColor,
        ),
      ),
    );
  }
}

class PageTransition extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    animation = CurvedAnimation(
      parent: animation,
      curve: Curves.linearToEaseOut,
      reverseCurve: Curves.easeInToLinear,
    );
    return SlideTransition(
      transformHitTests: false,
      position: animation.drive(Tween(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      )),
      child: child,
    );
  }
}
