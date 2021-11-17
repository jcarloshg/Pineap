// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({Key? key, this.subtitle = ""}) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 13.0,
        ),
      ),
    );
  }
}