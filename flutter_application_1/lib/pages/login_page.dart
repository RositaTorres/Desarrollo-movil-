// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/pages/info_general.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  User userLoad = User.Empty();

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString("user")!);
    userLoad = User.fromJson(userMap);
  }

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

  void _validateUser() {
    if (_email.text == userLoad.email && _password.text == userLoad.password) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const InfoGeneral()));
    } else {
      _showMsg("Correo o Contraseña incorrecta");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(image: AssetImage('assets/images/Logo.png')),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo Electronico'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Contraseña'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InfoGeneral()));
                  },
                  child: const Text('Iniciar Sesión'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text('Registrese'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
