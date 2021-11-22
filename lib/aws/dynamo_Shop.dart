// ignore_for_file: file_names

import 'package:amplify_flutter/amplify.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models_class/shop_model.dart';

class DynamoShop {
  static Future<String?> uploadShop(ShopModel shopModel) async {
    Shop shop = Shop(
      name: shopModel.name,
      id_photo: shopModel.idPhoto,
      address: shopModel.addres,
      type: shopModel.typeShop,
    );

    try {
      await Amplify.DataStore.save(shop);
    } catch (e) {
      // ignore: avoid_print
      print("[uploadShop] " + e.toString());
      return null;
    }
    return shopModel.toString();
  }
}
