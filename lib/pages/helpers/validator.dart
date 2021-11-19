class Validator {
  bool validate_name(String name) {
    if (name.isEmpty) return false;

    RegExp validate = RegExp(
        r'^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$');
    return validate.hasMatch(name);
  }

  bool validate_email(String email) {
    if (email.isEmpty) return false;

    RegExp validate = RegExp(
        r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$');
    return validate.hasMatch(email);
  }

  bool validate_pass(String pass) {
    if (pass.isEmpty) return false;
    if (pass.length < 8) return false;

    RegExp validate = RegExp(r'^[a-zA-Z0-9]+$');
    return validate.hasMatch(pass);
  }
}
