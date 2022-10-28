import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { masculino, femenino }

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repassword = TextEditingController();

  String _data = "Información: ";
  Genre? _genre = Genre.masculino;

  bool _gastronomia = false;
  bool _cultura = false;
  bool _aventurasExtremas = false;
  bool _descanso = false;

  String buttonMsg = "Fecha de nacimiento";

  String _date = "";

  String _dateConverter(DateTime newDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showSelectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime(2022, 8),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2022, 12),
      helpText: "Fecha de nacimiento",
    );
    if (newDate != null) {
      setState(() {
        _date = _dateConverter(newDate);
        buttonMsg = "Fecha de nacimiento: ${_date.toString()}";
      });
    }
  }

  void _showMsg(String msg) {
    final Scaffold = ScaffoldMessenger.of(context);
    Scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: Scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  void _onRegisterButtonClicked() {
    setState(() {
      if (_password.text == _repassword.text) {
        String genre = "Masculino";
        String favoritos = "";
        if (_genre == Genre.femenino) {
          genre = "Femenino";
        }

        if (_gastronomia) favoritos = "$favoritos Gastronomia";
        if (_cultura) favoritos = "$favoritos Cultura";
        if (_aventurasExtremas) favoritos = "$favoritos Aventuras Extremas";
        if (_descanso) favoritos = "$favoritos Descanso";
        var user = User(
            _name.text, _email.text, _password.text, genre, _date, favoritos);
        saveUser(user);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        _showMsg("Las contraseñas no coinciden");
      }
    });
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
                  controller: _name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre y Apellido'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                  keyboardType: TextInputType.text,
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
                TextFormField(
                  controller: _repassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirmar Contraseña'),
                  keyboardType: TextInputType.text,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Masculino'),
                        leading: Radio<Genre>(
                            value: Genre.masculino,
                            groupValue: _genre,
                            onChanged: (Genre? value) {
                              setState(() {
                                _genre = value;
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Femenino'),
                        leading: Radio<Genre>(
                            value: Genre.femenino,
                            groupValue: _genre,
                            onChanged: (Genre? value) {
                              setState(() {
                                _genre = value;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                const Text('¿Por que te gusta viajar?',
                    style: TextStyle(fontSize: 20)),
                CheckboxListTile(
                  title: const Text('Gastronomia'),
                  value: _gastronomia,
                  selected: _gastronomia,
                  onChanged: (bool? value) {
                    _gastronomia = value!;
                  },
                ),
                CheckboxListTile(
                  title: const Text('Cultura'),
                  value: _cultura,
                  selected: _cultura,
                  onChanged: (bool? value) {
                    _cultura = value!;
                  },
                ),
                CheckboxListTile(
                  title: const Text('Aventuras Extremas'),
                  value: _aventurasExtremas,
                  selected: _aventurasExtremas,
                  onChanged: (bool? value) {
                    _aventurasExtremas = value!;
                  },
                ),
                CheckboxListTile(
                  title: const Text('Descanso'),
                  value: _descanso,
                  selected: _descanso,
                  onChanged: (bool? value) {
                    _descanso = value!;
                  },
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    _showSelectDate();
                  },
                  child: Text(buttonMsg),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    _onRegisterButtonClicked();
                  },
                  child: const Text("Registrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
