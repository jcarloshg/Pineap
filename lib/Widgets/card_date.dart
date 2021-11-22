import 'package:flutter/material.dart';

class CardDate extends StatefulWidget {
  const CardDate({Key? key}) : super(key: key);

  @override
  _CardDateState createState() => _CardDateState();
}

class _CardDateState extends State<CardDate> {
  final String titleShop = "Barber shops";
  final String date = "November 21, 2021";
  final String dateTime = "10:00 pm";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            isThreeLine: true,
            leading: Image.asset(
              "assets/images/store_generec.jpg",
            ),
            title: Text(titleShop),
            subtitle: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.assignment,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(date)
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.schedule,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(dateTime)
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
