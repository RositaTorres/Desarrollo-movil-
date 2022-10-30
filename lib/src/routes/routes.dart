// There's importing the pages
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:flutter_application_1/src/pages/register_page.dart';
import 'package:flutter_application_1/src/pages/splash_page.dart';

// This function returns a map with the routes and pages
Map<String, WidgetBuilder> getRoutes() => {

  '/': (context) => const SplashPage(),
  'login': (context) => const LoginPage(),
  'register': (context) => const RegisterPage(),

};
