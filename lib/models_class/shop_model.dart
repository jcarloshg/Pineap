import 'package:flutter/material.dart';

class ShopModel extends ChangeNotifier {
  String name = "";
  String idPhoto = "";
  String addres = "";
  String typeShop = "";

  ShopModel();

  void setDate({
    required name,
    required idPhoto,
    required addres,
    required typeShop,
  }) {
    this.name = name;
    this.idPhoto = idPhoto;
    this.addres = addres;
    this.typeShop = typeShop;
    notifyListeners();
  }

  void setDataWithOutNotify({
    required name,
    required idPhoto,
    required addres,
    required typeShop,
  }) {
    this.name = name;
    this.idPhoto = idPhoto;
    this.addres = addres;
    this.typeShop = typeShop;
  }

  String get getName => name;
  String get getIdPhoto => idPhoto;
  String get getAddress => addres;
  String get getTypeShop => typeShop;
}
