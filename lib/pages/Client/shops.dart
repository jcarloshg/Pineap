import 'package:flutter/material.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';

class Shops extends StatefulWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            TitleWidget(title: "Negocios"),
            SubTitle(subtitle: "Negocios"),
          ],
        ),
      ),
    );
  }
}
