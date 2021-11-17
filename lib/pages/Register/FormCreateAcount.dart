// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:pineap/styles/SubTitle.dart';
import 'package:pineap/styles/TitleWidget.dart';

class FormCreateAcount extends StatefulWidget {
  const FormCreateAcount({Key? key}) : super(key: key);

  @override
  _FormCreateAcountState createState() => _FormCreateAcountState();
}

class _FormCreateAcountState extends State<FormCreateAcount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: const FormAcount());
  }
}

class FormAcount extends StatefulWidget {
  const FormAcount({Key? key}) : super(key: key);

  @override
  _FormAcountState createState() => _FormAcountState();
}

class _FormAcountState extends State<FormAcount> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const TitleWidget(title: "Crear una cuenta"),
          const SubTitle(subtitle: "Ingrese datos en todos los campos"),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Divider(color: Colors.white),
                const Divider(color: Colors.white),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Apellidos"),
                  validator: (String? value) {
                    return value == null ? 'Please enter some text' : null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nombre"),
                  validator: (String? value) {
                    return value == null ? 'Please enter some text' : null;
                  },
                ),
                TextFormField(
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
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Correo electronico"),
                  validator: (String? value) {
                    return value == null ? 'Please enter some text' : null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "contraseña",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                  ),
                  validator: (String? value) {
                    return value == null ? 'Please enter some text' : null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
