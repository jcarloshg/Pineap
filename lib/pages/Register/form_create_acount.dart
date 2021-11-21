// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pineap/aws/dynamo_person.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/helpers/validator.dart';
import 'package:pineap/models/person_model.dart';
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
  // data to form
  final _formKey = GlobalKey<FormState>();
  // to show show_loading
  bool isSignUpComplete = false;
  bool isChecked = false;
  bool showPass = false;
  // controles
  TextEditingController birthdayController = TextEditingController();
  TextEditingController typeShopController = TextEditingController();
  // data from person
  String lastName = "";
  String firstName = "";
  DateTime birthday = DateTime.now();
  // data from user
  String email = "";
  String pass = "";
  // model
  late PersonModel personModel;

  @override
  Widget build(BuildContext context) {
    personModel = Provider.of<PersonModel>(context);

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
                    onSaved: (value) => lastName = value!,
                    decoration: const InputDecoration(labelText: "Apellidos"),
                    validator: (String? value) =>
                        Validator.validate_name(value!),
                  ),
                  TextFormField(
                    onSaved: (value) => firstName = value!,
                    decoration: const InputDecoration(labelText: "Nombre"),
                    validator: (String? value) =>
                        Validator.validate_name(value!),
                  ),
                  TextFormField(
                    controller: birthdayController,
                    readOnly: true,
                    onTap: _showDataPicker,
                    decoration: InputDecoration(
                      labelText: "Fecha nacimiento",
                      suffixIcon: IconButton(
                        onPressed: _showDataPicker,
                        icon: const Icon(Icons.calendar_today),
                      ),
                    ),
                    validator: (String? value) => Validator.isEmpty(value!),
                  ),
                  const SizedBox(height: 32),
                  const TitleBlockForm(title_block_form: "Información usuario"),
                  TextFormField(
                    onSaved: (value) => email = value!,
                    decoration:
                        const InputDecoration(labelText: "correo electronico"),
                    validator: (String? value) =>
                        Validator.validate_email(value!),
                  ),
                  TextFormField(
                      obscureText: !showPass,
                      onSaved: (value) => pass = value!,
                      decoration: InputDecoration(
                        labelText: "contraseña",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                          icon: Icon(showPass
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined),
                        ),
                      ),
                      validator: (String? value) =>
                          Validator.validate_pass(value!)),
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
                            isChecked = !isChecked;
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
                    onPressed: onPressedregistred,
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

  void onPressedregistred() async {
    setState(() {
      isSignUpComplete = false;
    });

    Provider.of<PersonModel>(context, listen: false).setData(
      firstName: 'firstName',
      lastName: 'lastName',
      birthday: DateTime.now(),
      email: 'email',
      password: 'pass',
      role: Constants.client,
    );

    String resultado = await DynamoPerson.uploadPerson(personModel);
    // ignore: avoid_print
    print('the result is... ' + resultado);

    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();

    //   Provider.of<PersonModel>(context, listen: false).setData(
    //       firstName: firstName,
    //       lastName: lastName,
    //       birthday: birthday,
    //       email: email,
    //       password: pass,
    //       role: Constants.client);

    //   if (!isChecked) {
    //     Messages.scaffoldMessengerWidget(
    //         context: context, message: 'Debes aceptar terminos y condiciones');
    //     return;
    //   }

    //   bool isSignUpCompleteResponse = await Cognito.uploadInfoUserToCognito(
    //       context: context, email: email, pass: pass);

    //   if (isSignUpCompleteResponse) {
    //     Navigator.of(context).push(MaterialPageRoute(
    //         builder: (context) => const CodeVerificationShop()));
    //   } else {
    //     Messages.scaffoldMessengerWidget(
    //         context: context, message: 'El correo ya fue registrado');
    //   }
    // }

    setState(() {
      isSignUpComplete = true;
    });
  }

  _showDataPicker() {
    showDatePicker(
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2222))
        .then((value) {
      birthday = value!;
      birthdayController.text = DateFormat('MMMM dd, yyyy').format(value);
    });
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
