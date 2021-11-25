// ignore_for_file: file_names

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models_class/person_model.dart';
import 'package:pineap/models_class/shop_model.dart';

class DynamoShop {
  static Future<String?> uploadShop({required ShopModel shopModel}) async {
    // Shop shop = Shop(
    //   name: shopModel.name,
    //   id_photo: shopModel.idPhoto,
    //   address: shopModel.addres,
    //   type: shopModel.typeShop,
    //   person: person
    // );

    // try {
    //   await Amplify.DataStore.save(shop);
    // } catch (e) {
    //   // ignore: avoid_print
    //   print("[uploadShop] " + e.toString());
    //   return null;
    // }
    // return shopModel.toString();
  }

  static Future<String?> plok({
    required ShopModel shopModel,
    required PersonModel personModel,
  }) async {
    Person person = Person(
      last_name: personModel.lastName,
      first_name: personModel.firstName,
      birthday: TemporalDateTime(personModel.birthday),
      role: personModel.role,
      email: personModel.email,
    );

    Shop shop = Shop(
      Person: person,
      name: shopModel.name,
      type: shopModel.typeShop,
      address: shopModel.addres,
      id_photo: shopModel.idPhoto,
    );

    try {
      await Amplify.DataStore.save(person);
      // ignore: avoid_print
      print('Post saved');
      await Amplify.DataStore.save(shop);
      // ignore: avoid_print
      print('Comment saved');
    } catch (e) {
      // ignore: avoid_print
      print("[uploadShop] " + e.toString());
      return null;
    }
    return shopModel.toString();
  }
}
