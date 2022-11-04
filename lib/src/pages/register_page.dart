// Imports
// ignore_for_file: unused_field, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/styles/buttons_style.dart';
import 'package:flutter_application_1/repository/firebase_api.dart';
import '../models/user_model.dart';

import 'login_page.dart';

// Register widget (This widget has a variable state)
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// This enum has the valid genres for the app
enum Genre { male, femme, noBinary }

// Register state
class _RegisterPageState extends State<RegisterPage> {
  // Inputs controllers
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repeatPassword = TextEditingController();
  final TextEditingController _date = TextEditingController();

  // Declare and define a default value for the genre property
  final _data = "Información: ";
  Genre? _genre = Genre.male;

  // Pleasures or likes travel topics
  bool _culture = false;
  bool _extremeAdventures = false;
  bool _gastronomy = false;
  bool _relaxation = false;

  String buttonMsg = "Fecha de nacimiento";

  // This method shows the date picker
  void _showSelectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime(2022, 8),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2022, 12),
      helpText: "Fecha de nacimiento",
    );
    setState(() => {
          if (newDate != null)
            {
              _date.text = newDate.toString().split(' ')[0],
            }
          else
            {_showMessage('Debe seleccionar una fecha')}
        });
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

  // This method save information into firebase
  void _saveUser(User user) async {
    var result = await _firebaseApi.createUser(user);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void _registerUser(User user) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setString("user", jsonEncode(user));
    var result = await _firebaseApi.registerUser(user.email, user.password);
    String msg = "";
    if (result == "invalid-email") {
      msg = "El correo electrónico está mal escrito";
    } else if (result == "weak-password") {
      msg = "La contraseña debe tener minimo 6 digitos";
    } else if (result == "email-already-in-use") {
      msg = "Ya existe una cuenta con este correo electrónico";
    } else if (result == "network-request-failed") {
      msg = "Revise la conexion a internet";
    } else {
      msg = "Usuario registrado con exito";
      user.uid = result;
      _saveUser(user);
    }
    _showMsg(msg);
  }

  // This method register the user data and the redirects to the login
  void _onRegisterButtonClicked() {
    setState(() {
      if (_password.text == _repeatPassword.text) {
        String genre = "Masculino";
        String favoritos = "";
        if (_genre == Genre.femme) {
          genre = "Femenino";
        } else if (_genre == Genre.noBinary) {
          genre = "no binario";
        }
        if (_gastronomy) favoritos = "$favoritos Gastronomia";
        if (_culture) favoritos = "$favoritos Cultura";
        if (_extremeAdventures) favoritos = "$favoritos Aventuras Extremas";
        if (_relaxation) favoritos = "$favoritos Descanso";
        var user = User("", _name.text, _email.text, _password.text, genre,
            _date, favoritos);
        _registerUser(user);
      } else {
        _showMsg("Las contraseñas no coinciden");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // There's rendering the logo
              const Image(image: AssetImage('assets/images/logo.png')),

              // There's the input text fields
              const SizedBox(height: 16),
              _createInputTextField(_name, 'Nombre', 'Pepita Pérez',
                  TextInputType.text, false, Icons.account_circle),
              const SizedBox(height: 16),
              _createInputTextField(
                  _email,
                  'Correo electrónico',
                  'ejemplo@email.com',
                  TextInputType.emailAddress,
                  false,
                  Icons.alternate_email_outlined),
              const SizedBox(height: 16),
              _createInputTextField(_password, 'Contraseña', '******',
                  TextInputType.text, true, Icons.stream_sharp),
              const SizedBox(height: 16),
              _createInputTextField(_repeatPassword, 'Repertir contraseña',
                  '******', TextInputType.text, true, Icons.stream_sharp),
              const SizedBox(height: 16),
              // Date input field
              TextFormField(
                controller: _date,
                decoration: InputDecoration(
                    label: const Text('Fecha de nacimiento'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    icon: const Icon(Icons.calendar_month_sharp),
                    hintText: 'AAAA-MM-DD'),
                keyboardType: TextInputType.text,
                onTap: (() {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _showSelectDate();
                }),
              ),
              const SizedBox(height: 32),
              const Divider(),

              // Sex select radios
              const SizedBox(height: 32),
              const Text("Sexo:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
              _createRadio('Femenino', Genre.femme),
              _createRadio('Masculino', Genre.male),
              _createRadio('No binario', Genre.noBinary),
              const SizedBox(height: 32),
              const Divider(),

              // Activities checkboxes
              const SizedBox(height: 32),
              const Text("¿Por qué te gusta viajar?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
              CheckboxListTile(
                  title: const Text('Aventuras extremas'),
                  value: _extremeAdventures,
                  onChanged: (bool? selected) =>
                      setState(() => _extremeAdventures = selected!)),
              CheckboxListTile(
                  title: const Text('Cultura'),
                  value: _culture,
                  onChanged: (bool? selected) =>
                      setState(() => _culture = selected!)),
              CheckboxListTile(
                  title: const Text('Descanso'),
                  value: _relaxation,
                  onChanged: (bool? selected) =>
                      setState(() => _relaxation = selected!)),
              CheckboxListTile(
                  title: const Text('Gastronomía'),
                  value: _gastronomy,
                  onChanged: (bool? selected) =>
                      setState(() => _gastronomy = selected!)),
              const SizedBox(height: 32),
              const Divider(),

              // Register and login button
              const SizedBox(height: 32),
              ElevatedButton(
                  onPressed: _onRegisterButtonClicked,
                  style: getTextButtonPrimaryStyle(),
                  child: const Text('Registro')),
              TextButton(
                child: const Text('Iniciar sesión',
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 16)),
                onPressed: () => Navigator.pushNamed(context, 'login'),
              ),
              const SizedBox(height: 32)
            ],
          ),
        )),
      ),
    );
  }

  // This method returns an input text field
  Widget _createInputTextField(
      TextEditingController controller,
      String label,
      String hintText,
      TextInputType textInputType,
      bool obscured,
      IconData icon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          icon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: label,
          hintText: hintText),
      keyboardType: textInputType,
      obscureText: obscured,
    );
  }

  // This method returns an radio button
  Widget _createRadio(String title, Genre value) {
    return ListTile(
      title: Text(title),
      leading: Radio<Genre>(
        value: value,
        groupValue: _genre,
        onChanged: ((Genre? option) => setState(() => _genre = option)),
      ),
    );
  }

  // This method shows a message in the bottom screen
  void _showMessage(String message) {
    ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
      ),
    ));
  }

  /*  if (_extremeAdventures) genreBooks += 'Aventuras extremas';
    if (_culture) genreBooks += ', cultura';
    if (_gastronomy) genreBooks += ', gastronomía';
    if (_relaxation) genreBooks += ', descanso';
    User user = User(_name.text, _email.text, _password.text, genre,
        _date.text, genreBooks);
    _savePreferences(user);
    Navigator.pushNamed(context, 'login');
  }*/
}
