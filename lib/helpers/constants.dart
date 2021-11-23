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

  // state of day
  static String get isOpen => "Abierto";
  static String get isClose => "Cerrado";
  static List<String> get stateDay => [isOpen, isClose];

  // days
  static String get today => "Hoy";
  static String get tomorrow => "Mañana";
  static String get dateEspecific => "Fecha especifico";
  static List<String> get typesDayToSearch => [
        today,
        tomorrow,
        dateEspecific,
      ];

  // methods payment
  static String get cash => "Efectivo";
  static String get creditCard => "Tarjeta de credito";
}
