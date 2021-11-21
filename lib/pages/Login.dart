// ignore_for_file: file_names

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_datastore/amplify_datastore_stream_controller.dart';
import 'package:flutter/material.dart';
import 'package:pineap/amplifyconfiguration.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/pages/Client/home_page_client.dart';
import 'package:pineap/pages/Register/form_create_acount.dart';
import 'package:pineap/pages/Register/register_shops/form_create_acount_shops.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
// dart async library we will refer to when setting up real time updates
import 'dart:async';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    _configureAmplify();
    super.initState();
  }

  Future<void> _configureAmplify() async {
    try {
      // amplify plugins
      await Amplify.addPlugin(AmplifyAPI());
      await Amplify.addPlugin(
          AmplifyDataStore(modelProvider: ModelProvider.instance));
      await Amplify.addPlugin(AmplifyAuthCognito());
      // configure Amplify - note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      // ignore: avoid_print
      print('[_configureAmplify] + $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // constraints: const BoxConstraints(maxHeight: double.infinity),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgorundlogin.jpg"),
              fit: BoxFit.fitHeight),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 400,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white70,
              // border: Border.all(color: Colors.black87),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Center(
            child: Text(
              "Pineap",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "user"),
            validator: (value) => _validate_username(value),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "password"),
            validator: (value) => _validate_password(value),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomePageClient()));
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Log in'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Aún no te has registrado? "),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.brown,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FormCreateAcount()));
                },
                child: const Text("Crea una cuenta aquí"),
              )
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.brown,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FormCreateAcountShops()));
            },
            child: const Text("Crear una cuenta como negocio"),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  String? _validate_username(value) => (value == null || value?.isEmpty)
      ? 'Introduce tu nombre de usuario'
      : null;

  // ignore: non_constant_identifier_names
  String? _validate_password(value) =>
      (value == null || value?.isEmpty) ? 'Introduce tu contraseña' : null;
}
