// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text(
              "Hola coma",
              style: TextStyle(
                fontSize: 48.0,
              ),
            ),
            Text("Hola coma"),
          ],
        ),
        // title: const Text("VALE CHETOS"),
      ),
    );
  }
}
