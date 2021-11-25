import 'package:flutter/material.dart';
import 'package:pineap/models/ModelProvider.dart';

class ShopModel extends ChangeNotifier {
  String name = "";
  String idPhoto = "";
  String addres = "";
  String typeShop = "";
  List<Day>? days;

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

  void setDataWithShop({required Shop shop}) {
    name = shop.name;
    idPhoto = shop.id_photo;
    addres = shop.address;
    typeShop = shop.type;
    notifyListeners();
  }

  void setDays({required List<Day> days}) {
    this.days = days;

    // this.days!.forEach((day) => print(day.toString()));

    notifyListeners();
  }

  @override
  String toString() {
    return "name = $name"
        "idPhoto = $idPhoto"
        "addres = $addres"
        "typeShop = $typeShop ";
  }

  String get getName => name;
  String get getIdPhoto => idPhoto;
  String get getAddress => addres;
  String get getTypeShop => typeShop;
  List<Day>? get getDays => days;
}
