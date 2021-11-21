import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:pineap/Widgets/show_loading.dart';
import 'package:pineap/helpers/validator.dart';
import 'package:pineap/models/person_model.dart';
import 'package:pineap/pages/Client/home_page_client.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';
import 'package:provider/provider.dart';

class CodeVerificationShop extends StatefulWidget {
  const CodeVerificationShop({Key? key}) : super(key: key);

  @override
  _CodeVerificationShopState createState() => _CodeVerificationShopState();
}

class _CodeVerificationShopState extends State<CodeVerificationShop> {
  // data to form
  final _formKey = GlobalKey<FormState>();
  // data from user
  bool isSignUpComplete = false;
  int codeVerification = -1;
  // controllers =
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return isSignUpComplete
        ? ShowLoading(
            message: "Verificando código...",
          )
        : Scaffold(
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
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _show_form(),
            ),
          );
  }

  // ignore: non_constant_identifier_names
  Widget _show_form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const TitleWidget(title: "Código verificación"),
        const SubTitle(subtitle: "Tu código debe tener 6 carácteres"),
        const SizedBox(height: 32),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                  controller: codeController,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  onSaved: (value) => codeVerification = int.parse(value!),
                  decoration:
                      const InputDecoration(labelText: "Ingresa tu código"),
                  validator: (String? value) =>
                      Validator.validate_code_verification(value!)),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.brown,
                    ),
                  ),
                  onPressed: () {
                    _resent_code(Provider.of<PersonModel>(context).getEmail);
                  },
                  child: const Text("Reenvia tu codigo"),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  // ignore: avoid_print
                  print(Provider.of<PersonModel>(context).toString());

                  // ignore: avoid_print
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   sendCodeAWS(Provider.of<PersonModel>(context).getEmail);
                  // }
                },
                child: const Text('Ingresar'),
              )
            ],
          ),
        )
      ],
    );
  }

  void sendCodeAWS(String username) async {
    setState(() {
      isSignUpComplete = true;
    });
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: codeVerification.toString(),
      );
      setState(() {
        isSignUpComplete = res.isSignUpComplete;
      });

      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePageClient()));
    } on AuthException catch (e) {
      // ignore: avoid_print
      print("[sendCodeAWS ]" + e.message);
      setState(() {
        isSignUpComplete = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al verificar el código'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ignore: non_constant_identifier_names
  void _resent_code(String username) async {
    try {
      await Amplify.Auth.resendSignUpCode(username: username);
    } on AuthException catch (e) {
      // ignore: avoid_print
      print("[_resent_code ]" + e.message);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al reenviar el código'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
