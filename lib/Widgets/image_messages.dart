import 'dart:math';

import 'package:flutter/material.dart';

class ImageMessages extends StatefulWidget {
  ImageMessages({Key? key, required this.message}) : super(key: key);

  String message;

  @override
  State<ImageMessages> createState() => _ImageMessagesState();
}

class _ImageMessagesState extends State<ImageMessages> {
  final List<String> urisImages = [
    "assets/images/pineapple_background_circle.png",
    "assets/images/pineapple_glasses_circle.png",
    "assets/images/pineapple_sky_circle.png",
  ];

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 32),
            Image(
              image: AssetImage(urisImages[random.nextInt(3)]),
              height: 250,
              width: 250,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(height: 16),
            Text(
              widget.message,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
