// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pineap/models/person.dart';
import 'package:pineap/pages/Register/code_verification.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_block_form.dart';
import 'package:pineap/styles/title_widget.dart';
import 'package:provider/provider.dart';

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
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
                  const SizedBox(height: 32),
                  const TitleBlockForm(
                      title_block_form: "Información personal"),
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
                  const SizedBox(height: 16),
                  const TitleBlockForm(title_block_form: "Información usuario"),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "correo electronico"),
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
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
                      
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CodeVerification()));
                    },
                    child: const Text('Registrarse'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
