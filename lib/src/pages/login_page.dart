// Imports
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/styles/buttons_style.dart';
import '../models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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

  @override
  void initState() {
    _getUser();
    super.initState();
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
  void _getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(preferences.getString("user")!);
    userLoad = User.fromJson(userMap);
  }

  // This method validates the user information a might redirect the user
  void _validateUser() {
    if (_email.text != userLoad.getEmail ||
        _password.text != userLoad.getPassword) {
      _showMsg("Correo o Contraseña incorrecta");
      return;
    }
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => const InfoGeneral()));
  }

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
}
