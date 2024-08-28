import 'package:flutter/material.dart';

class Routes {
  static const String login = 'login';
  static const String home = 'home';
}

class Assets {
  static const splashScreenImage =
      'lib/utils/resources/images/splash_presion.jpg';
  static const loginImage = 'lib/utils/resources/images/logo_presion.png';
}

class Const {
  static const double padding = 8;
  static const double borderRadius = 4;
  static const double borderRadiusButton = 8;
  static const double paddingButton = 20;
}

class Screens {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
