import 'package:annar_app/config/themes/custom_theme.dart';
import 'package:annar_app/ui/features/home/bloc/home_bloc.dart';
import 'package:annar_app/ui/features/login/bloc/login_bloc.dart';
import 'package:annar_app/ui/features/splash/view/pages/splash_page.dart';
import 'package:annar_app/ui/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_injection/injection.dart' as di;

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialice dependency injection here.
  await di.init();

  return runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => di.locator<LoginBloc>()),
      BlocProvider(create: (_) => di.locator<HomeBloc>())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Annar-app',
      theme: themeLight(context),
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      home: const SplashPage(),
    );
  }
}
