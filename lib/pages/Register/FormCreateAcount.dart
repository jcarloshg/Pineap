// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:pineap/styles/Styles.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              TitleWidget(title: "Crear una cuenta"),
              SubTitle(subtitle: "Ingrese datos en todos los campos"),
              
            ],
          ),
        ],
      ),
    );
  }
}
