// Imports
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


// There's running the application
void main() {
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
        primarySwatch: Colors.blue,
      ),

    );
  }
}
