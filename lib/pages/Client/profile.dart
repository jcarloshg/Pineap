import 'package:flutter/material.dart';
import 'package:pineap/Widgets/info_box.dart';
import 'package:pineap/models_class/person_model.dart';
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
  late PersonModel personModel;

  // info user
  final String firstName = "Jose Carlos";
  final String lastName = "Huerta";
  final String birthday = DateTime.now().toIso8601String();
  final String email = "carlosj12336@gmail.com";
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
              // info shop
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
                  '$firstName $lastName',
                  style: const TextStyle(fontSize: 18),
                ),
                alignment: Alignment.bottomCenter,
              ),
              //
              // info shop
              const SizedBox(height: 32),
              const TitleBlockForm(title_block_form: "Información del usuario"),
              InfoBox(info: birthday, icon: const Icon(Icons.person)),
              InfoBox(info: email, icon: const Icon(Icons.email)),
              InfoBox(info: pass, icon: const Icon(Icons.password)),
              //
              // info shop
              const SizedBox(height: 32),
              TextButton(onPressed: () {}, child: const Text("Cerrar sesion")),
            ],
          ),
        ),
      ),
    );
  }
}
