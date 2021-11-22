// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Messages {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      scaffoldMessengerWidget({
    required BuildContext context,
    required String message,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
