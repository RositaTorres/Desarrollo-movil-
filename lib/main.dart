// Imports
// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/src/models/local_favourite.dart';
import 'package:flutter_application_1/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// There's running the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  Hive.registerAdapter(LocalFavouriteAdapter());

  await Hive.openBox<LocalFavourite>('favourites');

  runApp(const MyApp());
}

// App widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // There's deactivating the debug banner
      debugShowCheckedModeBanner: false,

      // Application properties
      title: 'Destino Colombia',
      initialRoute: '/',
      routes: getRoutes(),

      // Language settings
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("es", "CO"),
      ],

      // Style properties
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
