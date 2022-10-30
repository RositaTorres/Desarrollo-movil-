// Imports
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/styles/buttons_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import 'dart:convert';

// Register widget (This widget has a variable state)
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

// This enum has the valid genders for the app
enum Gender { male, femme, noBinary}

// Register state
class RegisterPageState extends State<RegisterPage> {
  // Inputs controllers
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();
  final TextEditingController _date = TextEditingController();

  // Declare and define a default value for the gender property
  Gender? _gender = Gender.femme;

  // Pleasures or likes travel topics
  bool _culture = false;
  bool _extremeAdventures = false;
  bool _gastronomy = false;
  bool _relaxation = false;

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
              _createInputTextField(_name, 'Nombre', 'Pepita Pérez', TextInputType.text, false, Icons.account_circle),
              const SizedBox(height: 16),
              _createInputTextField(_email, 'Correo electrónico', 'ejemplo@email.com',
                  TextInputType.emailAddress, false, Icons.alternate_email_outlined),
              const SizedBox(height: 16),
              _createInputTextField(_password, 
                  'Contraseña', '******', TextInputType.text, true, Icons.stream_sharp),
              const SizedBox(height: 16),
              _createInputTextField(_repeatPassword, 'Repertir contraseña', '******',TextInputType.text,
                  true, Icons.stream_sharp),
              const SizedBox(height: 16),
              // Date input field
              TextFormField(
                controller: _date,
                decoration: InputDecoration(
                  label: const Text('Fecha de nacimiento'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  icon: const Icon(Icons.calendar_month_sharp),
                  hintText: 'AAAA-MM-DD'
                ),
                keyboardType: TextInputType.text,
                onTap: (() {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _useDatePicker();
                }),
              ),
              const SizedBox(height: 32),
              const Divider(),

              // Sex select radios
              const SizedBox(height: 32),
              const Text(
                "Sexo:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic
                )
              ),
              _createRadio('Femenino', Gender.femme),
              _createRadio('Masculino', Gender.male),
              _createRadio('No binario', Gender.noBinary),
              const SizedBox(height: 32),
              const Divider(),

              // Activities checkboxes
              const SizedBox(height: 32),
              const Text(
                "¿Por qué te gusta viajar?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic
                )
              ),
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
                  onPressed: _onCLickRegister,
                  style: getTextButtonPrimaryStyle(),
                  child:
                      const Text('Registro')),
              TextButton(
                child: const Text('Iniciar sesión',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16)),
                onPressed: () => Navigator.pushNamed(context, 'login'),
              ),
              const SizedBox(height: 32)
            ],
          ),
          )
        ),
      ),
    );
  }

  // This method returns an input text field
 Widget _createInputTextField(
      TextEditingController controller, String label, String hintText, TextInputType textInputType, bool obscured, IconData icon) {
    return TextFormField(
      controller: controller,
      decoration:
          InputDecoration(
            icon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: label,
            hintText: hintText
          ),
      keyboardType: textInputType,
      obscureText: obscured,
    );
  }


  // This method returns an radio button
  Widget _createRadio(String title, Gender value) {
    return ListTile(
      title: Text(title),
      leading: Radio<Gender>(
        value: value,
        groupValue: _gender,
        onChanged: ((Gender? option) => setState(() => _gender = option)),
      ),
    );
  }

  // This method shows the date picker
  void _useDatePicker() async {
    DateTime? datePicker = await showDatePicker(
        locale: const Locale('es', 'CO'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2030),
        helpText: "Selcciona una fecha");

    setState(() => {
      
      if(datePicker != null){
        _date.text = datePicker.toString().split(' ')[0],
      }else{
      _showMessage('Debes seleccionar una fecha')
      }

    });
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

  // This method save information into the target device
  Future<void> _savePreferences(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', jsonEncode(user));
  }

  // This method register the user data and the redirects to the login
  void _onCLickRegister() {
    if (_password.text != _repeatPassword.text) {
      _showMessage('Las contraseñas deben coincidir');
      return;
    }

    String gender;
    if(_gender == Gender.femme){
      gender = 'Masculino';
    }
    else if(_gender == Gender.male){
      gender = 'Femenino';
    }
    else{
      gender = 'No binario';
    }
    
    String genderBooks = '';

    if (_extremeAdventures) genderBooks += 'Aventuras extremas';
    if (_culture) genderBooks += ', cultura';
    if (_gastronomy) genderBooks += ', gastronomía';
    if (_relaxation) genderBooks += ', descanso';

    User user = User(_name.text, _email.text, _password.text, gender,
        _date.text, genderBooks);

    _savePreferences(user);

    Navigator.pushNamed(context, 'login');
  }
}
