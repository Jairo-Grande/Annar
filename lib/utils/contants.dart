import 'package:flutter/material.dart';

class Routes {
  static const String login = 'login';
  static const String home = 'home';
}

class Assets {
  static const splashScreenImage =
      'lib/utils/resources/images/splash_presion.jpg';
}

class Const {
  static const double padding = 8;
  static const double borderRadius = 4;
}

class Screens {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
