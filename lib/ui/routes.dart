import 'package:annar_app/ui/features/home/view/pages/home_page.dart';
import 'package:annar_app/ui/features/login/view/pages/login_page.dart';
import 'package:annar_app/utils/contants.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.login: (context) => const LoginPage(),
  Routes.home: (context) => const HomePage()
};
