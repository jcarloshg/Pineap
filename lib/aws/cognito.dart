import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

class Cognito {
  static void resentCode(String username, BuildContext context) async {
    try {
      await Amplify.Auth.resendSignUpCode(username: username);
    } on AuthException catch (e) {
      // ignore: avoid_print
      print("[_resent_code ]" + e.message);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al reenviar el código'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  static void sendCodeAWS(
      String username, String codeVerification, BuildContext context) async {
    bool isSignUpComplete = false;
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: codeVerification.toString(),
      );

      isSignUpComplete = res.isSignUpComplete;

    } on AuthException catch (e) {
      // ignore: avoid_print
      print("[sendCodeAWS ]" + e.message);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al verificar el código'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
