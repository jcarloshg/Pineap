// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class TitleBlockForm extends StatelessWidget {
  const TitleBlockForm({Key? key, this.title_block_form = ""})
      : super(key: key);

  final String title_block_form;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title_block_form.toUpperCase(),
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
