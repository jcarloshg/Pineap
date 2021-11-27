import 'package:flutter/material.dart';
import 'package:pineap/Widgets/card_shop.dart';
import 'package:pineap/Widgets/label_with_icon.dart';
import 'package:pineap/aws/dynamo_Shop.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/styles/messages.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';

class Shops extends StatefulWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  final searchShopController = TextEditingController();
  List<Shop>? listShops;

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
                  // onChanged: (value) => _searchShops(
                  //   name: value,
                  //   context: context,
                  // ),
                  decoration: InputDecoration(
                    labelText: "Busca tus negocios favoritos",
                    suffixIcon: IconButton(
                      onPressed: () => _searchShops(
                        name: searchShopController.text,
                        context: context,
                      ),
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ),
                //
                //
                // list seach
                const SizedBox(height: 16),
                (listShops == null)
                    ? const Align(
                        alignment: Alignment.center,
                        child: Text("No existen coincidencias"),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: listShops!.length,
                          itemBuilder: (context, index) {
                            return const CardShopWidget();
                          },
                        ),
                      ),
                const CardShopWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _searchShops({
    required String name,
    required BuildContext context,
  }) async {
    List<Shop>? shopsResponse = await DynamoShop.getShopsByName(name: name);

    if (shopsResponse == null) {
      Messages.scaffoldMessengerWidget(
        context: context,
        message: "No se encontraron coincidencias",
      );
    } else {
      for (Shop element in shopsResponse) {
        // ignore: avoid_print
        print(element.toString());
      }
      // setState(() => listShops = shopsResponse);
    }
  }
}
