import 'package:flutter/material.dart';
import 'package:pineap/Widgets/info_box.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/models_class/person_model.dart';
import 'package:pineap/models_class/shop_model.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ShopModel shopModel;
  late PersonModel personModel;
  //info shop
  String titleShop = "Barber shops";
  bool isOpen = true;
  String isOpenString = Constants.isClose;
  String address = "C. Vicente Guerrero #40, Col. Rosas del Tepeyac ";
  String uriPhoto = "assets/images/backgorundlogin.jpg";
  // info user
  final String firstName = "Jose Carlos";
  final String lastName = "Huerta";
  final String email = "carlosj12336@gmail.com";
  final String pass = "........";

  @override
  Widget build(BuildContext context) {
    shopModel = Provider.of<ShopModel>(context);
    personModel = Provider.of<PersonModel>(context);

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
                Image(
                  image: AssetImage(uriPhoto),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Align(
                  child: Text(
                    shopModel.getShop!.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
                InfoBox(
                    icon: const Icon(Icons.place),
                    info: shopModel.getShop!.address),
                //
                // info cliente
                const SizedBox(height: 32),
                const SubTitle(subtitle: "Información del gerente"),
                InfoBox(
                    icon: const Icon(Icons.person),
                    info:
                        '${personModel.getPerson.first_name} ${personModel.getPerson.last_name}'),
                InfoBox(
                    icon: const Icon(Icons.view_day),
                    info: personModel.getPerson.email),
                InfoBox(
                    icon: const Icon(Icons.email),
                    info: personModel.getPerson.email),
                InfoBox(icon: const Icon(Icons.password), info: pass),
                //
                //info cliente
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
