import 'package:annar_app/ui/features/splash/view/pages/splash_page.dart';
import 'package:annar_app/ui/routes.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Annar-app',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      home: const SplashPage(),
    );
  }
}
