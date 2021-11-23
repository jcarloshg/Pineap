import 'package:flutter/material.dart';
import 'package:pineap/Widgets/info_box.dart';
import 'package:pineap/aws/cognito.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // info shop
  final String titleShop = "Barber shops";
  final bool isOpen = true;
  final String isOpenString = Constants.isClose;
  final String address = "C. Vicente Guerrero #40, Col. Rosas del Tepeyac ";
  final String uriPhoto = "assets/images/backgorundlogin.jpg";
  // info user
  final String firstName = "Jose Carlos";
  final String lastName = "Huerta";
  final String email = "carlosj12336@gmail.com";
  final String pass = "........";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const TitleWidget(title: "Perfil del negocio"),
                const SubTitle(
                  subtitle: "Esta es toda la información de tu negocio.",
                ),
                //
                // info shop
                const SizedBox(height: 32),
                Image(image: AssetImage(uriPhoto)),
                const SizedBox(height: 16),
                Align(
                  child: Text(titleShop, style: const TextStyle(fontSize: 18)),
                  alignment: Alignment.bottomCenter,
                ),
                InfoBox(icon: const Icon(Icons.place), info: address),
                //
                // info cliente
                const SizedBox(height: 32),
                const SubTitle(subtitle: "Información del gerente"),
                InfoBox(
                    icon: const Icon(Icons.person),
                    info: '$firstName $lastName'),
                InfoBox(icon: const Icon(Icons.email), info: email),
                InfoBox(icon: const Icon(Icons.password), info: pass),
                //
                // info cliente
                const SizedBox(height: 32),
                Align(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.brown,
                      ),
                    ),
                    onPressed: onPressedCerrarSesion,
                    child: const Text("Cerrar sesión"),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressedCerrarSesion() async {
    // await Cognito.singOut(context: context);
  }
}
