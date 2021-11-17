// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, this.title = ""}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}
