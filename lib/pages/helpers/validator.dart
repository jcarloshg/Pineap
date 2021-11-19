class Validator {
  bool validate_name(String name) {
    if (name.isEmpty) return false;

    RegExp validate = RegExp(r'^[a-zA-Z]+$');
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
    if (pass.length < 4) return false;

    RegExp validate = RegExp(r'^[a-zA-Z0-9]+$');
    return validate.hasMatch(pass);
  }
}
