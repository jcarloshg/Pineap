// ignore_for_file: file_names

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:pineap/amplifyconfiguration.dart';
import 'package:pineap/aws/cognito.dart';
import 'package:pineap/aws/dynamo_Shop.dart';
import 'package:pineap/aws/dynamo_day.dart';
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

      //
      //
      // get email from current user
      String? userEmail = await Cognito.getCurrentUserEmail(context: context);
      if (userEmail == null) {
        Messages.scaffoldMessengerWidget(
            context: context, message: "error al obtener info user");
        return;
      }

      //
      //
      // set data person
      Person? person = await DynamoPerson.getPerson(userEmail: userEmail);
      if (person == null) {
        Messages.scaffoldMessengerWidget(
            context: context, message: "error al obtener info user");
        return;
      }
      Provider.of<PersonModel>(context, listen: false).setDataWithPerson(
        person: person,
      );

      if (person.role == Constants.client) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePageClient()),
        );
      } else {
        //
        //
        // set data shop
        Shop? shop = (await Amplify.DataStore.query(
          Shop.classType,
          where: Shop.PERSON.eq(person.id),
        ))[0];
        if (shop == null) return;
        Provider.of<ShopModel>(context, listen: false)
            .setDataWithShop(shop: shop);
        //
        //
        // set day
        List<Day> days = await Amplify.DataStore.query(
          Day.classType,
          where: Day.SHOP.eq(shop.getId()),
        );
        Provider.of<ShopModel>(context, listen: false).setDays(days: days);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomeManagerPage()),
        );
      }
    }
  }

  void onPressedCerrarSesion() async {
    await Cognito.singOut(context: context);

    // ========================================================
    // ========================================================
    // ========================================================
    // ========================================================

    // PersonModel personModel = PersonModel();
    // ShopModel shopModel = ShopModel();

    // personModel.setDataWithOutNotify(
    //   lastName: "Huerta",
    //   firstName: "Jose Carlos",
    //   birthday: DateTime.now(),
    //   role: Constants.manager,
    //   email: "carlosj12336@gmail.com",
    //   password: "qazwsx123",
    // );
    // Person? uploadPersonResponse = await DynamoPerson.uploadPerson(
    //   personModel: personModel,
    // );
    // if (uploadPersonResponse == null) return;
    // // ignore: avoid_print
    // print("YA NO SE REGISTRO...........................PERSON");

    // shopModel.setDataWithOutNotify(
    //   name: "Holaaaa",
    //   idPhoto: "",
    //   addres: "C. Vicente Guerrero #40, Col. Rosas del Tepeyac",
    //   typeShop: Constants.barberiaSHOP,
    // );
    // Shop? uploadShopResponse = await DynamoShop.uploadShop(
    //   shopModel: shopModel,
    //   person: uploadPersonResponse,
    // );
    // if (uploadShopResponse == null) return;
    // // ignore: avoid_print
    // print("YA NO SE REGISTRO...........................PERSON");

    // Day dayDomingo = Day(
    //   hour_open: "09:00 hrs",
    //   hour_close: "17:00 hrs",
    //   dayName: "DOMINGO",
    //   day: DaysName.DOMINGO,
    //   isOpen: true,
    //   Shop: uploadShopResponse,
    // );
    // Day dayLUNES = Day(
    //   hour_open: "09:00 hrs",
    //   hour_close: "17:00 hrs",
    //   dayName: "Lunes",
    //   day: DaysName.LUNES,
    //   isOpen: true,
    //   Shop: uploadShopResponse,
    // );
    // Day dayMARTES = Day(
    //   hour_open: "09:00 hrs",
    //   hour_close: "17:00 hrs",
    //   dayName: "Lunes",
    //   day: DaysName.MARTES,
    //   isOpen: true,
    //   Shop: uploadShopResponse,
    // );
    // Day dayMIERCOLES = Day(
    //   hour_open: "09:00 hrs",
    //   hour_close: "17:00 hrs",
    //   dayName: "Lunes",
    //   day: DaysName.MIERCOLES,
    //   isOpen: true,
    //   Shop: uploadShopResponse,
    // );
    // Day dayJUEVES = Day(
    //   hour_open: "09:00 hrs",
    //   hour_close: "17:00 hrs",
    //   dayName: "Lunes",
    //   day: DaysName.JUEVES,
    //   isOpen: true,
    //   Shop: uploadShopResponse,
    // );
    // Day dayVIERNES = Day(
    //   hour_open: "09:00 hrs",
    //   hour_close: "17:00 hrs",
    //   dayName: "Lunes",
    //   day: DaysName.VIERNES,
    //   isOpen: true,
    //   Shop: uploadShopResponse,
    // );
    // Day daySABADO = Day(
    //   hour_open: "09:00 hrs",
    //   hour_close: "17:00 hrs",
    //   dayName: "Lunes",
    //   day: DaysName.SABADO,
    //   isOpen: true,
    //   Shop: uploadShopResponse,
    // );

    // if (DynamoDay.uploadDay(day: dayDomingo) == null) return;
    // if (DynamoDay.uploadDay(day: dayLUNES) == null) return;
    // if (DynamoDay.uploadDay(day: dayMARTES) == null) return;
    // if (DynamoDay.uploadDay(day: dayMIERCOLES) == null) return;
    // if (DynamoDay.uploadDay(day: dayJUEVES) == null) return;
    // if (DynamoDay.uploadDay(day: dayVIERNES) == null) return;
    // if (DynamoDay.uploadDay(day: daySABADO) == null) return;

    // ========================================================
    // ========================================================
    // ========================================================
    // ========================================================

    // await DynamoPerson.getPerson(userId: userId);
  }
}
