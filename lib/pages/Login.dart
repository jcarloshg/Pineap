// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            height: 300,
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
            child: Text("Pineap"),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
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
          const Center(
            child: Text("Aún no te has registrado?"),
          ),
        ],
      ),
    );
  }
}
