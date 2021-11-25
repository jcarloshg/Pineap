import 'package:flutter/material.dart';
import 'package:pineap/Widgets/show_loading.dart';
import 'package:pineap/aws/cognito.dart';
import 'package:pineap/aws/dynamo_Shop.dart';
import 'package:pineap/aws/dynamo_person.dart';
import 'package:pineap/helpers/validator.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models_class/person_model.dart';
import 'package:pineap/models_class/shop_model.dart';
import 'package:pineap/pages/Manager/home_manager.dart';
import 'package:pineap/styles/messages.dart';
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

  late PersonModel personModel;
  late ShopModel shopModel;

  @override
  Widget build(BuildContext context) {
    personModel = Provider.of<PersonModel>(context);
    shopModel = Provider.of<ShopModel>(context);

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
              child: showForm(),
            ),
          );
  }

  Widget showForm() {
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
                alignment: Alignment.centerLeft,
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.brown,
                    ),
                  ),
                  onPressed: () => Cognito.resentCode(
                    username: personModel.getEmail,
                    context: context,
                  ),
                  child: const Text("Reenvia tu codigo"),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: onPressedIngresar,
                // ignore: avoid_print
                // if (_formKey.currentState!.validate()) {
                //   _formKey.currentState!.save();
                //   sendCodeAWS(Provider.of<PersonModel>(context).getEmail);
                // }
                child: const Text('Ingresar'),
              )
            ],
          ),
        )
      ],
    );
  }

  void onPressedIngresar() async {
    setState(() => isSignUpComplete = true);

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      //
      //
      // send code verfication
      bool isSignUpCompleteResponse = await Cognito.sendCodeAWS(
        username: personModel.getEmail,
        codeVerification: codeVerification,
        context: context,
      );
      if (!isSignUpCompleteResponse) {
        Messages.scaffoldMessengerWidget(
            context: context, message: 'Error al verificar el código');

        setState(() => isSignUpComplete = false);
        return;
      }

      //
      //
      // upload indo user
      Person? uploadPersonResponse = await DynamoPerson.uploadPerson(
        personModel: personModel,
      );
      if (uploadPersonResponse == null) {
        Messages.scaffoldMessengerWidget(
            context: context, message: 'Error al registrar info del usuario');

        setState(() => isSignUpComplete = false);
        return;
      }

      //
      //
      // upload info shop
      Shop? uploadShopResponse = await DynamoShop.uploadShop(
        shopModel: shopModel,
        person: uploadPersonResponse,
      );
      if (uploadShopResponse == null) {
        Messages.scaffoldMessengerWidget(
            context: context, message: 'Error al registrar info del negocio');

        setState(() => isSignUpComplete = false);
        return;
      }

      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomeManagerPage()));
    }

    setState(() => isSignUpComplete = false);
  }
}
