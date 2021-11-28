import 'package:flutter/material.dart';
import 'package:pineap/Widgets/card_shop.dart';
import 'package:pineap/Widgets/image_messages.dart';
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
    _getAllShops();

    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                      SubTitle(subtitle: "Busca negocios y crea reservaciones"),
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
              Expanded(
                child: (listShops == null || listShops!.isEmpty)
                    ? ImageMessages(message: "No se encontraron coincidencias")
                    : ListView.builder(
                        itemCount: listShops!.length,
                        itemBuilder: (context, index) {
                          return const CardShopWidget();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getAllShops() async {
    if (searchShopController.text == "") {
      List<Shop>? shopsResponse = await DynamoShop.getShops();
      listShops = shopsResponse;
    }
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
      setState(() => listShops!.clear());
    } else {
      setState(() => listShops = shopsResponse);
    }
  }
}
