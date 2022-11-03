// There's importing the pages
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/list_page.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:flutter_application_1/src/pages/register_page.dart';
import 'package:flutter_application_1/src/pages/splash_page.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_2.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_3.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_4.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_5.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_6.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_7.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_8.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_9.dart';



// This function returns a map with the routes and pages
Map<String, WidgetBuilder> getRoutes() => {

  '/': (context) => const SplashPage(),
  'login': (context) => const LoginPage(),
  'register': (context) => const RegisterPage(),
  'list': (context) => const ListPage(),
  'InfoGeneral1': (context) => const InfoGeneral(),
  'InfoGeneral2': (context) => const InfoGeneral2(),
  'InfoGeneral3': (context) => const InfoGeneral3(),
  'InfoGeneral4': (context) => const InfoGeneral4(),
  'InfoGeneral5': (context) => const InfoGeneral5(),
  'InfoGeneral6': (context) => const InfoGeneral6(),
  'InfoGeneral7': (context) => const InfoGeneral7(),
  'InfoGeneral8': (context) => const InfoGeneral8(),
  'InfoGeneral9': (context) => const InfoGeneral9(),

};
