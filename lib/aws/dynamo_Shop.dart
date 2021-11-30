// ignore_for_file: file_names

import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models_class/person_model.dart';
import 'package:pineap/models_class/shop_model.dart';

class DynamoShop {
  static Future<Shop?> uploadShop({
    required Person person,
    required ShopModel shopModel,
  }) async {
    Shop shop = Shop(
      Person: person,
      name: shopModel.name,
      type: shopModel.typeShop,
      address: shopModel.addres,
      id_photo: shopModel.idPhoto,
    );

    try {
      await Amplify.DataStore.save(shop);
    } catch (e) {
      // ignore: avoid_print
      print("[uploadShop] " + e.toString());
      return null;
    }

    return shop;
  }

  static Future<List<Shop>?> getShopsByName({
    required String name,
  }) async {
    try {
      List<Shop> shopsResponse = await Amplify.DataStore.query<Shop>(
        Shop.classType,
        where: Shop.NAME.contains(name),
      );

      return shopsResponse;
    } catch (e) {
      // ignore: avoid_print
      print("[getShopsByName ] " + e.toString());
      return null;
    }
  }

  static Future<Shop?> getByID({
    required String id,
  }) async {
    try {
      List<Shop> shopsResponse = await Amplify.DataStore.query<Shop>(
        Shop.classType,
        where: Shop.ID.eq(id),
      );

      return shopsResponse[0];
    } catch (e) {
      // ignore: avoid_print
      print("[getByID ] " + e.toString());
    }

    return null;
  }

  static Future<List<Shop>?> getShops() async {
    try {
      List<Shop> shopsResponse =
          await Amplify.DataStore.query<Shop>(Shop.classType);

      return shopsResponse;
    } catch (e) {
      // ignore: avoid_print
      print("[getShopsByName ] " + e.toString());
      return null;
    }
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

  static getByIdQuery({required String id}) async {
    try {
      String graphQLDocument = '''
      query MyQuery(\$id: ID) {
        getShop(id: \$id) {
          PersonID
          _deleted
          _lastChangedAt
          _version
          address
          createdAt
          id
          name
          id_photo
          type
          updatedAt
        }
      }
      ''';

      var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
            document: graphQLDocument, variables: {'id': id}),
      );

      var response = await operation.response;
      var data = response.data;

      final otraData = json.decode(data);

      // ignore: avoid_print
      print(otraData);
    } catch (e) {
      // ignore: avoid_print
      print("[getByIdQuery] " + e.toString());
      return null;
    }
  }
}
