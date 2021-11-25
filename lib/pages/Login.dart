// ignore_for_file: file_names

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:pineap/amplifyconfiguration.dart';
import 'package:pineap/aws/cognito.dart';
import 'package:pineap/aws/dynamo_Shop.dart';
import 'package:pineap/aws/dynamo_person.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/helpers/validator.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models_class/person_model.dart';
import 'package:pineap/models_class/shop_model.dart';
import 'package:pineap/pages/Client/home_page_client.dart';
import 'package:pineap/pages/Manager/home_manager.dart';
import 'package:pineap/pages/Register/form_create_acount.dart';
import 'package:pineap/pages/Register/register_shops/form_create_acount_shops.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
// dart async library we will refer to when setting up real time updates
import 'dart:async';

import 'package:pineap/styles/messages.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // variables to form
  final _formKey = GlobalKey<FormState>();
  bool showPass = false;
  // variables to login
  final emailController = TextEditingController();
  final passController = TextEditingController();

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
            height: 500,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white70,
              // border: Border.all(color: Colors.black87),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Form(
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
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "user"),
                    validator: (value) => Validator.validate_email(value!),
                  ),
                  TextFormField(
                    controller: passController,
                    obscureText: !showPass,
                    decoration: InputDecoration(
                      labelText: "contraseña",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() => showPass = !showPass);
                        },
                        icon: Icon(showPass
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                      ),
                    ),
                    validator: (String? value) =>
                        Validator.validate_pass(value!),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: onPressedLogIn,
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
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.brown,
                      ),
                    ),
                    onPressed: onPressedCerrarSesion,
                    child: const Text("Cerrar sesión"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPressedLogIn() async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const HomePageClient()),
    );

    if (_formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      String pass = passController.text.trim();

      bool isSignedIn =
          await Cognito.singIn(context: context, email: email, pass: pass);

      if (!isSignedIn) {
        Messages.scaffoldMessengerWidget(
            context: context, message: "Usuario o contraseña equivocadors.");
        return;
      }

      String userEmail = await Cognito.getCurrentUserEmail(context: context);
      Person? person = await DynamoPerson.getPerson(userEmail: userEmail);

      if (person == null) {
        Messages.scaffoldMessengerWidget(
            context: context, message: "error al obtener info user");
        return;
      }

      Provider.of<PersonModel>(context, listen: false).setData(
        firstName: person.first_name,
        lastName: person.last_name,
        birthday: person.birthday!.getDateTimeInUtc(),
        email: person.email,
        password: pass,
        role: person.role,
      );

      if (person.role == Constants.client) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePageClient()),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomeManagerPage()),
        );
      }
    }
  }

  void onPressedCerrarSesion() async {
    PersonModel personModel = PersonModel();
    ShopModel shopModel = ShopModel();

    personModel.setDataWithOutNotify(
      lastName: "Huerta",
      firstName: "Jose Carlos",
      birthday: DateTime.now(),
      role: Constants.manager,
      email: "carlosj12336@gmail.com",
      password: "qazwsx123",
    );

    shopModel.setDataWithOutNotify(
      name: "Holaaaa",
      idPhoto: "",
      addres: "C. Vicente Guerrero #40, Col. Rosas del Tepeyac",
      typeShop: Constants.barberiaSHOP,
    );

    final response =
        DynamoShop.plok(shopModel: shopModel, personModel: personModel);

    // ignore: avoid_print, unnecessary_null_comparison
    print(response == null ? "no se registro" : "si se hizo compa   ");

    // await Cognito.singOut(context: context);

    // String userId = await Cognito.getCurrentUserID(context: context);
    // await DynamoPerson.getPerson(userId: userId);
  }
}
