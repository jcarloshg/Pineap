class Constants {
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
}
