import 'package:flutter/material.dart';
import 'package:pineap/Widgets/label_with_icon.dart';

class CardShopWidget extends StatefulWidget {
  const CardShopWidget({Key? key}) : super(key: key);

  @override
  _CardShopWidgetState createState() => _CardShopWidgetState();
}

class _CardShopWidgetState extends State<CardShopWidget> {
  // info shop
  final String titleShop = "Barber shops";
  final String uriPhoto = "assets/images/backgorundlogin.jpg";
  //
  final String hour = "09:00 - 19:00 hrs";
  final String rating = "4.5";
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            onTap: () {},
            isThreeLine: true,
            leading: Image.asset(uriPhoto),
            title: Text(titleShop),
            subtitle: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                LabelWithIcon(
                  iconData: Icons.schedule,
                  info: hour,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                const SizedBox(height: 8),
                LabelWithIcon(
                  iconData: Icons.star,
                  info: rating,
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
