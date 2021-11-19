import 'package:flutter/material.dart';

class ShopModel extends ChangeNotifier {
  String name = "";
  String idPhoto = "";
  String typeShop = "";

  ShopModel();

  void setDate({required name, required idPhoto, required typeShop}) {
    this.name = name;
    this.idPhoto = idPhoto;
    this.typeShop = typeShop;
    notifyListeners();
  }

  String get getName => name;
  String get getIdPhoto => idPhoto;
  String get getTypeShop => typeShop;
}
