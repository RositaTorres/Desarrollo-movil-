import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/firebase_api.dart';
import 'package:intl/intl.dart';
import '../models/user_model.dart';
import '../styles/buttons_style.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { masculino, femenino }

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repassword = TextEditingController();

  final _data = "Información: ";
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
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(image: AssetImage('assets/images/logo.png')),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    label: const Text('Nombre y apellido'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    icon: const Icon(Icons.account_circle),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    label: const Text('Correo electrónico'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    icon: const Icon(Icons.alternate_email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    label: const Text('Contraseña'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    icon: const Icon(Icons.stream_sharp),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _repassword,
                  decoration: InputDecoration(
                    label: const Text('Repetir contraseña'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    icon: const Icon(Icons.stream_sharp),
                  ),
                  keyboardType: TextInputType.text,
                ),
                // Sex select radios
                const SizedBox(height: 32),
                const Text("Sexo:",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                _createRadio('Femenino', Genre.femenino),
                _createRadio('Masculino', Genre.masculino),

                // Activities checkboxes
                const SizedBox(height: 32),
                const Text("¿Por qué te gusta viajar?",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),

                CheckboxListTile(
                    title: const Text('Aventuras extremas'),
                    value: _aventurasExtremas,
                    onChanged: (bool? selected) =>
                        setState(() => _aventurasExtremas = selected!)),
                CheckboxListTile(
                    title: const Text('Cultura'),
                    value: _cultura,
                    onChanged: (bool? selected) =>
                        setState(() => _cultura = selected!)),
                CheckboxListTile(
                    title: const Text('Descanso'),
                    value: _descanso,
                    onChanged: (bool? selected) =>
                        setState(() => _descanso = selected!)),
                CheckboxListTile(
                    title: const Text('Gastronomía'),
                    value: _gastronomia,
                    onChanged: (bool? selected) =>
                        setState(() => _gastronomia = selected!)),
                const SizedBox(height: 32),
                const Divider(),

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
          ),
        ),
      ),
    );
  }

  //This method returns an radio button
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
}
