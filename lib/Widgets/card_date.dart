import 'package:flutter/material.dart';
import 'package:pineap/aws/dynamo_Shop.dart';
import 'package:pineap/aws/dynamo_reservation.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/models/Reservation.dart';
import 'package:pineap/models/Shop.dart';
import 'package:pineap/pages/Manager/info_reservation.dart';
import 'package:pineap/styles/messages.dart';

class CardDate extends StatefulWidget {
  const CardDate({Key? key, required this.reservation}) : super(key: key);

  final Reservation reservation;

  @override
  _CardDateState createState() => _CardDateState();
}

class _CardDateState extends State<CardDate> {
  late String titleShop = "Tacos el patrón";
  late String date = Constants.getFormatDateTime(dateTime: DateTime.now());
  late String hour = "10:00 pm";
  late String uriPhotoShop = "assets/images/backgorundlogin.jpg";

  @override
  void initState() {
    super.initState();
    setState(() {
      //
      // set info date
      date = Constants.getFormatDateTime(
          dateTime: widget.reservation.date!.getDateTime());

      hour = Constants.getFormatTimeOfDay(
          timeOfDay:
              TimeOfDay.fromDateTime(widget.reservation.hour!.getDateTime()));
    });

    _setInfoShop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            onTap: navigateToInfoReservation,
            isThreeLine: true,
            leading: Image.asset(uriPhotoShop),
            title: Text(titleShop),
            subtitle: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    const Icon(Icons.calendar_today, size: 12),
                    const SizedBox(width: 4),
                    Text(date)
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    const Icon(Icons.schedule, size: 12),
                    const SizedBox(width: 4),
                    Text(hour)
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

  void navigateToInfoReservation() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const InfoReservation()),
    );
  }

  Future<void> _setInfoShop() async {
    try {
      //
      // set info shop
      String? shopId =
          await DynamoReservation.getShopId(id: widget.reservation.getId());
      // ignore: avoid_print
      //print(shopId);

      Shop? shop = await DynamoShop.getByID(id: shopId!);
      // ignore: avoid_print
      //print(shop.toString());

      setState(() {
        titleShop = shop!.name;
        // here get id:photo
      });
    } catch (e) {
      // ignore: avoid_print
      print("[_setInfoShop] " + e.toString());
      Messages.scaffoldMessengerWidget(
          context: context, message: "Err al obtener la información");
    }
  }
}
