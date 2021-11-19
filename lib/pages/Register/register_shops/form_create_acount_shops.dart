import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:pineap/pages/Register/register_shops/code_verification_shop.dart';
import 'package:pineap/pages/helpers/validator.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_block_form.dart';
import 'package:pineap/styles/title_widget.dart';

class FormCreateAcountShops extends StatefulWidget {
  const FormCreateAcountShops({Key? key}) : super(key: key);

  @override
  _FormCreateAcountShopsState createState() => _FormCreateAcountShopsState();
}

class _FormCreateAcountShopsState extends State<FormCreateAcountShops> {
  // data to form
  final _formKey = GlobalKey<FormState>();

  // data from user
  bool isChecked = false;
  String lastName = "";
  String firstName = "";
  String email = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.brown,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TitleWidget(title: "Crear una cuenta para tu negocio"),
              const SubTitle(subtitle: "Ingrese datos en todos los campos"),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const TitleBlockForm(
                        title_block_form: "Información personal del titular"),
                    TextFormField(
                      onSaved: (value) => lastName = value!,
                      decoration: const InputDecoration(labelText: "Apellidos"),
                      validator: (String? value) {
                        return Validator().validate_name(value!)
                            ? null
                            : 'Ingresa solo caracteres';
                      },
                    ),
                    TextFormField(
                      onSaved: (value) => firstName = value!,
                      decoration: const InputDecoration(labelText: "Nombre"),
                      validator: (String? value) {
                        return Validator().validate_name(value!)
                            ? null
                            : 'Ingresa solo caracteres';
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      onTap: () {},
                      decoration: InputDecoration(
                        labelText: "Fecha nacimiento",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_today),
                        ),
                      ),
                      validator: (String? value) {
                        return value == null ? 'Please enter some text' : null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const TitleBlockForm(
                        title_block_form: "Información usuario"),
                    TextFormField(
                      onSaved: (value) => email = value!,
                      decoration: const InputDecoration(
                          labelText: "correo electronico"),
                      validator: (String? value) {
                        return Validator().validate_email(value!)
                            ? null
                            : 'Debe tener la estructura "example@email.com"';
                      },
                    ),
                    TextFormField(
                      onSaved: (value) => pass = value!,
                      decoration: InputDecoration(
                        labelText: "contraseña",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                      ),
                      validator: (String? value) {
                        return Validator().validate_pass(value!)
                            ? null
                            : 'Debe ser alfanumerico y mayor a 8 caracteres';
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const Text("Aceptar terminos y condiciones"),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _register_a_user();
                        }
                      },
                      child: const Text('Registrarse'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void _register_a_user() async {
    if (isChecked) {
      try {
        Map<String, String> userAttributes = {
          'email': email,
          // additional attributes as needed
        };
        // ignore: unused_local_variable
        SignUpResult res = await Amplify.Auth.signUp(
          username: email,
          password: pass,
          options: CognitoSignUpOptions(userAttributes: userAttributes),
        );
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CodeVerificationShop(username: email)));
      } on AuthException catch (e) {
        // ignore: avoid_print
        print(e.message);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes aceptar terminos y condiciones'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.brown;
  }
}
