import 'package:flutter/material.dart';
import 'package:pineap/styles/title_block_form.dart';

class LabelWithIcon extends StatelessWidget {
  const LabelWithIcon(
      {Key? key,
      required this.iconData,
      required this.info,
      this.mainAxisAlignment})
      : super(key: key);

  final IconData iconData;
  final String info;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: (mainAxisAlignment != null)
          ? mainAxisAlignment!
          : MainAxisAlignment.start,
      children: <Widget>[
        Icon(iconData, size: 12),
        const SizedBox(width: 4),
        TitleBlockForm(title_block_form: info),
        // Text(info)
      ],
    );
  }
}
