// Imports
// ignore_for_file: unused_import, unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_2.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_3.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_4.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_5.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_6.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_7.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_8.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_9.dart';
import 'package:flutter_application_1/src/styles/buttons_style.dart';
import '../models/user_model.dart';
import 'package:flutter_application_1/repository/firebase_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'list_page.dart';

// Login widget (This widget has a variable state)
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Login state
class _LoginPageState extends State<LoginPage> {
  // Input controllers
  final _email = TextEditingController();
  final _password = TextEditingController();

  // User information
  User userLoad = User.empty();

  final FirebaseApi _firebaseApi = FirebaseApi();

  @override
  void initState() {
    // _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
            child: SingleChildScrollView(
                child: Column(
          children: <Widget>[
            // There's rendering the logo
            const Image(image: AssetImage('assets/images/logo.png')),

            // Email and password inputs
            const SizedBox(height: 16.0),
            _createFormTextField(_email, 'Correo electrónico',
                'ejemplo@email.com', false, Icons.alternate_email_outlined),
            const SizedBox(height: 16.0),
            _createFormTextField(_password, 'Contraseña', '*******', true,
                Icons.stream_outlined),
            const SizedBox(height: 16.0),

            // Login button
            ElevatedButton(
              style: getTextButtonPrimaryStyle(),
              onPressed: _validateUser,
              child: const Text('Iniciar Sesión'),
            ),

            // Register redirect button
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue)),
              onPressed: () => Navigator.pushNamed(context, 'register'),
              child: const Text('Registrese'),
            ),
          ],
        ))),
      ),
    );
  }

  // This method returns a form text field
  Widget _createFormTextField(TextEditingController controller, String label,
      String hintText, bool obscured, IconData icon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          icon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: label,
          hintText: hintText),
      keyboardType: TextInputType.text,
      obscureText: obscured,
    );
  }

  // This method loads the user information
  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString("user")!);
    userLoad = User.fromJson(userMap);
  }

  // This method validates the user information a might redirect the user

  // This method show a message in the bottom screen

  void _showMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _validateUser() async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showMsg("Debe digitar el correo y la contraseña");
    } else {
      var result = await _firebaseApi.logInUser(_email.text, _password.text);
      String msg = "";
      if (result == "invalid-email") {
        msg = "El correo electrónico está mal escrito";
      } else if (result == "wrong-password") {
        msg = "Correo o contraseña incorrecta";
      } else if (result == "user-not-found") {
        msg = "Usuario no registrado";
      } else if (result == "network-request-failed") {
        msg = "Revise la conexion a internet";
      } else {
        msg = "Bienvenido";
        _showMsg(msg);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }
  }
}
