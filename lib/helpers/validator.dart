// ==============================================================
// ==============================================================
// ==============================================================
//
// IMPORTANT !!!
//
// this clase only contains fuctions that they are validators
// each validator return...
//
//          - if is empty return [FIELD_EMPTY]
//          - if not hasMatch return a message
//          - if is not empty and hasMatch return a null
//
// ==============================================================
// ==============================================================
// ==============================================================

class Validator {
  // ignore: constant_identifier_names
  static const String FIELD_EMPTY = "Campo vacio";

  static String? isEmpty(String value) => value.isEmpty ? FIELD_EMPTY : null;

  // ignore: non_constant_identifier_names
  static String? validate_name(String name) {
    RegExp validate = RegExp(
        r'^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$');

    String? response = isEmpty(name);
    if (response != null) return response;

    return validate.hasMatch(name) ? null : 'Ingresa solo caracteres';
  }

  // ignore: non_constant_identifier_names
  static String? validate_email(String email) {
    RegExp validate = RegExp(
        r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$');

    String? response = isEmpty(email);
    if (response != null) return response;

    return validate.hasMatch(email)
        ? null
        : 'Debe tener la estructura "example@email.com"';
  }

  // ignore: non_constant_identifier_names
  static String? validate_pass(String pass) {
    RegExp validate = RegExp(r'^[a-zA-Z0-9]+$');

    const String message = 'Debe ser alfanumerico y mayor a 8 caracteres';

    String? response = isEmpty(pass);
    if (response != null || pass.length < 8) return response;

    return validate.hasMatch(pass) ? null : message;
  }

  // ignore: non_constant_identifier_names
  static String? validate_code_verification(String codeVerification) {
    RegExp validate = RegExp(r'^(\d{6})?$');

    String? response = isEmpty(codeVerification);
    if (response != null || codeVerification.length < 7) return response;

    return validate.hasMatch(codeVerification) ? null : "Deben ser 6 digitos";
  }

  static String? validateAddress(String address) {
    RegExp validate = RegExp(r'^[#.0-9a-zA-ZÀ-ÿ\u00f1\u00d1\s,-]+$');

    String? response = isEmpty(address);
    if (response != null || address.length < 7) return response;

    return validate.hasMatch(address)
        ? null
        : 'Debe ingresar caracteres, números, ';
  }
}
