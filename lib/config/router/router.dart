import 'dart:async';
import 'package:azelpo/app.dart';
import 'package:azelpo/constants/routes.dart';
import 'package:azelpo/screens/auth/signin/login_page.dart';
import 'package:azelpo/screens/auth/signup/signup_page.dart';
import 'package:azelpo/screens/services/widget/product_detail_page.dart';
import 'package:azelpo/screens/splash_screen/splash_screen.dart';
import 'package:azelpo/screens/widgets/setup_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Navigate {
  Navigate._();

  /// Push named
  static Future<T?> pushNamed<T>(String routeName, {RouteSettings? settings}) {
    return MyApp.materialNavKey.currentState!
        .pushNamed<T>(routeName, arguments: settings?.arguments);
  }

  /// Replace screen
  static Future replaceNamed<T, TO>(String routeName,
      {RouteSettings? settings}) {
    return MyApp.materialNavKey.currentState!
        .pushReplacementNamed<T, TO>(routeName, arguments: settings?.arguments);
  }

  /// Remove all and push
  static Future toNamedAndRemoveAll<T, TO>(String routeName,
      {RouteSettings? settings}) {
    return MyApp.materialNavKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  /// close current screen
  /// if can not close the application
  static Future<void> close<T>([T? result]) async {
    if (MyApp.materialNavKey.currentState!.canPop()) {
      return MyApp.materialNavKey.currentState!.pop<T>(result);
    }
    return await SystemNavigator.pop();
  }

  /// if may close then closes the screen
  static void mayClose<T>([T? result]) async {
    await MyApp.materialNavKey.currentState!.maybePop<T>(result);
  }

  /// Registering or adding all of `Routes` used all over the application
  static Map<String, WidgetBuilder> get routes => {
        Routes.home: (_) => const SetupFlow(),
        Routes.productDetail: (_) => const ProductDetailPage(),
        Routes.splashScreen: (_) => const SplashScreenPage(),
        Routes.login: (_) => const LoginPage(),
        Routes.signUp: (_) => const SignUpPage(),
      };
}
