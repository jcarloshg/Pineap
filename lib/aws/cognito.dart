import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:pineap/styles/messages.dart';

class Cognito {
  static void resentCode({
    required String username,
    required BuildContext context,
  }) async {
    try {
      await Amplify.Auth.resendSignUpCode(username: username);
    } on AuthException catch (e) {
      // ignore: avoid_print
      print("[_resent_code ]" + e.message);
      Messages.scaffoldMessengerWidget(
          context: context, message: 'Error al reenviar el código');
    }
  }

  static Future<bool> sendCodeAWS({
    required String username,
    required int codeVerification,
    required BuildContext context,
  }) async {
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
    }
    return isSignUpComplete;
  }

  static Future<bool> uploadInfoUserToCognito({
    required BuildContext context,
    required String email,
    required String pass,
  }) async {
    bool isSignUpComplete = false;
    try {
      Map<String, String> userAttributes = {
        'email': email,
        // additional attributes as needed
      };
      SignUpResult res = await Amplify.Auth.signUp(
        username: email,
        password: pass,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      isSignUpComplete = res.isSignUpComplete;
    } on AuthException catch (e) {
      // ignore: avoid_print
      print(e.message);
      if (e.message == "Username already exists in the system.") {
        Messages.scaffoldMessengerWidget(
            context: context, message: 'El correo ya fue registrado');
      }
    }
    return isSignUpComplete;
  }

  static Future<bool> singIn({
    required BuildContext context,
    required String email,
    required String pass,
  }) async {
    bool isSignedIn = false;
    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: email,
        password: pass,
      );

      isSignedIn = res.isSignedIn;
    } on AuthException catch (e) {
      // ignore: avoid_print
      print("[singIn] " + e.message);
    }
    return isSignedIn;
  }

  static Future<String> getCurrentUserID(
      {required BuildContext context}) async {
    String userId = "";
    try {
      AuthUser authUser = await Amplify.Auth.getCurrentUser();
      // ignore: avoid_print
      userId = authUser.userId;
    } on AuthException catch (e) {
      String err = "[getCurrentUser]" + e.message;
      // ignore: avoid_print
      print(err);
      Messages.scaffoldMessengerWidget(
          context: context, message: "[singIn]" + err);
    }

    return userId;
  }

  static Future<String?> getCurrentUserEmail({
    required BuildContext context,
  }) async {
    String userEmail = "";
    try {
      AuthUser authUser = await Amplify.Auth.getCurrentUser();
      // ignore: avoid_print
      userEmail = authUser.username;
    } on AuthException catch (e) {
      String err = "[getCurrentUser]      " + e.message;
      // ignore: avoid_print
      print(err);
      Messages.scaffoldMessengerWidget(
          context: context, message: "[singIn]" + err);
      return null;
    }

    return userEmail;
  }

  static Future<void> singOut({required BuildContext context}) async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      // ignore: avoid_print
      print("[singOut] " + e.message);

      Messages.scaffoldMessengerWidget(
          context: context, message: "[singOut] " + e.message);
    }
  }

  static Future<AuthUser?> getCurrentUser() async {
    try {
      AuthUser authUserResponse = await Amplify.Auth.getCurrentUser();
      return authUserResponse;
    } on AuthException catch (e) {
      // ignore: avoid_print
      print("[getCurrentUser ] " + e.message);
      return null;
    }
  }
}
