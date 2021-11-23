import 'package:flutter/material.dart';
import 'package:pineap/Widgets/card_shop.dart';
import 'package:pineap/Widgets/label_with_icon.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';

class Shops extends StatefulWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  final searchShopController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                //
                //
                // header title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        TitleWidget(title: "Negocios"),
                        SubTitle(
                            subtitle: "Busca negocios y crea reservaciones"),
                      ],
                    ),
                    const LabelWithIcon(
                      iconData: Icons.place,
                      info: "Obtener ubucación actual",
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ],
                ),
                //
                //
                // field to search reservations
                const SizedBox(height: 32),
                TextField(
                  controller: searchShopController,
                  decoration: InputDecoration(
                    labelText: "Busca tus negocios favoritos",
                    suffixIcon: IconButton(
                      onPressed: () => print(searchShopController.text),
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ),
                //
                //
                // list seach
                const SizedBox(height: 16),
                const CardShopWidget(),
                const CardShopWidget(),
                const CardShopWidget(),
                const CardShopWidget(),
                const CardShopWidget(),
                const CardShopWidget(),
                const CardShopWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
