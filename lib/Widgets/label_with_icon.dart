import 'package:flutter/material.dart';

class LabelWithIcon extends StatelessWidget {
  const LabelWithIcon({
    Key? key,
    required this.iconData,
    required this.info,
  }) : super(key: key);

  final IconData iconData;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(iconData, size: 12),
        const SizedBox(width: 4),
        Text(info)
      ],
    );
  }
}
