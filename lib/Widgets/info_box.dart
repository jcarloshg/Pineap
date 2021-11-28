import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    Key? key,
    this.icon,
    this.title,
    required this.info,
  }) : super(key: key);

  final Icon? icon;
  final String info;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              // border: Border.all(color: Colors.black87),
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (title != null)
                  Text(title!, style: const TextStyle(fontSize: 18.0)),
                if (icon != null) icon!,
                Text(info),
              ],
            ))
      ],
    );
  }
}
