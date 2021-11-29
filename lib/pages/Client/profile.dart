import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:pineap/Widgets/info_box.dart';
import 'package:pineap/aws/cognito.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/models_class/person_model.dart';
import 'package:pineap/pages/Login.dart';
import 'package:pineap/styles/messages.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_block_form.dart';
import 'package:pineap/styles/title_widget.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // info user
  late PersonModel personModel;
  final String pass = "........";
  final String uriPhoto = "assets/images/backgorundlogin.jpg";

  @override
  Widget build(BuildContext context) {
    personModel = Provider.of<PersonModel>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const TitleWidget(title: "Perfil del cliente"),
              const SubTitle(subtitle: "Esta es toda tu información"),
              //
              // info person
              const SizedBox(height: 32),
              Image(
                image: AssetImage(uriPhoto),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Align(
                child: Text(
                  '${personModel.getPerson.first_name} ${personModel.getPerson.last_name}',
                  style: const TextStyle(fontSize: 18),
                ),
                alignment: Alignment.bottomCenter,
              ),
              //
              // info user
              const SizedBox(height: 32),
              const TitleBlockForm(title_block_form: "Información del usuario"),
              InfoBox(
                info: Constants.getFormatDateTime(
                    dateTime: DateTime.parse(
                        personModel.getPerson.birthday.toString())),
                icon: const Icon(Icons.person),
              ),
              InfoBox(
                info: personModel.getPerson.email,
                icon: const Icon(Icons.email),
              ),
              InfoBox(
                info: pass,
                icon: const Icon(Icons.password),
              ),
              //
              // info shop
              const SizedBox(height: 32),
              TextButton(
                onPressed: () async => await _singOut(),
                child: const Text("Cerrar sesion"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _singOut() async {
    SignOutResult? signOutResult = await Cognito.singOut();

    if (signOutResult == null) {
      Messages.scaffoldMessengerWidget(
        context: context,
        message: "Error al cerrar sesión",
      );
      return;
    }

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
