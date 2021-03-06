import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  // signo de pesos
  static String get signoPesos => "\$";

  // rols from users
  static const String client = "CLIENT";
  static const String manager = "MANAGER";

  // types shops
  static String get restauranteSHOP => "Restaurante";
  static String get barberiaSHOP => "Barberias";
  static String get dentistaSHOP => "Dentista";
  static String get lavanderiaSHOP => "Lavanderia";
  static String get otroSHOP => "Otro";
  static List<String> get typesShops => [
        restauranteSHOP,
        barberiaSHOP,
        dentistaSHOP,
        lavanderiaSHOP,
        otroSHOP,
      ];

  // state of day
  static String get isOpen => "Abierto";
  static String get isClose => "Cerrado";
  static List<String> get stateDay => [isOpen, isClose];

  // days
  static String get showAlls => "Mostrar todas";
  static String get today => "Hoy";
  static String get tomorrow => "Mañana";
  static String get dateEspecific => "Fecha especifico";
  static List<String> get typesDayToSearch => [
        showAlls,
        today,
        tomorrow,
        dateEspecific,
      ];

  // methods payment
  static String get cash => "Efectivo";
  static String get creditCard => "Tarjeta de credito";
  static List<String> get typesMethodPayment => [
        cash,
        creditCard,
      ];

  static String getFormatTimeOfDay({TimeOfDay? timeOfDay}) {
    String format = "";

    if (timeOfDay!.hour < 10) format += "0";
    format += "${timeOfDay.hour}";
    format += ":";
    if (timeOfDay.minute < 10) format += "0";
    format += "${timeOfDay.minute} hrs";

    return format;
  }

  // get format date like << November 22, 2021 >>
  static String getFormatDateTime({required DateTime dateTime}) {
    return DateFormat('MMMM dd, yyyy').format(dateTime);
  }
}
