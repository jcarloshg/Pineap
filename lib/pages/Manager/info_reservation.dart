import 'package:flutter/material.dart';
import 'package:pineap/Widgets/info_box.dart';
import 'package:pineap/aws/dynamo_Shop.dart';
import 'package:pineap/aws/dynamo_person.dart';
import 'package:pineap/aws/dynamo_reservation.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models/Reservation.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_block_form.dart';
import 'package:pineap/styles/title_widget.dart';

class InfoReservation extends StatefulWidget {
  const InfoReservation({Key? key, required this.reservation})
      : super(key: key);

  final Reservation reservation;

  @override
  _InfoReservationState createState() => _InfoReservationState();
}

class _InfoReservationState extends State<InfoReservation> {
  // info shop
  late String titleShop = "";
  late bool isOpen = true;
  late String isOpenString = Constants.isOpen;
  late String uriPhoto = "assets/images/backgorundlogin.jpg";
  // info reservation
  late String address = "";
  late String date = "";
  late String dateTime = "";
  // info user
  late String firstName = "Jose Carlos";
  late String lastName = "Huerta";
  late String email = "carlosj12336@gmail.com";
  // method payment
  late String methodPayment = Constants.cash;

  // entities
  late Shop? shop;
  late Person? person;

  @override
  initState() {
    super.initState();
    _getInfoPersonAndShop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.brown,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              const TitleWidget(title: "Información de la reservación"),
              const SubTitle(subtitle: "Información detallada"),
              //
              // photo shop
              const SizedBox(height: 32),

              //
              //
              // photo
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image(
                  image: AssetImage(uriPhoto),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),

              //
              // name shop
              InfoBox(title: titleShop, info: isOpenString),
              //
              // info general
              const SizedBox(height: 32),
              const TitleBlockForm(title_block_form: "Información general"),
              InfoBox(icon: const Icon(Icons.place), info: address),
              InfoBox(icon: const Icon(Icons.calendar_today), info: date),
              InfoBox(icon: const Icon(Icons.schedule), info: dateTime),
              //
              // info cliente
              const SizedBox(height: 16),
              const TitleBlockForm(title_block_form: "Información del cliente"),
              InfoBox(
                  icon: const Icon(Icons.person), info: '$firstName $lastName'),
              InfoBox(icon: const Icon(Icons.email), info: email),
              //
              // info general
              const SizedBox(height: 16),
              const TitleBlockForm(title_block_form: "Método de pago"),
              InfoBox(icon: const Icon(Icons.credit_card), info: methodPayment),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getInfoPersonAndShop() async {
    try {
      //
      //
      // set info shop
      String? shopId =
          await DynamoReservation.getShopId(id: widget.reservation.getId());
      Shop? shop = await DynamoShop.getByID(id: shopId!);

      //
      //
      // set info shop
      String? personId =
          await DynamoReservation.getPersonId(id: widget.reservation.getId());
      Person? person = await DynamoPerson.getByID(id: personId!);

      setState(() {
        //
        // set models
        this.shop = shop;
        this.person = person;

        //
        // set reservation
        address = shop!.address;
        date = Constants.getFormatDateTime(
            dateTime: widget.reservation.date!.getDateTime());
        dateTime = Constants.getFormatTimeOfDay(
            timeOfDay:
                TimeOfDay.fromDateTime(widget.reservation.hour!.getDateTime()));

        //
        // set info user
        firstName = person!.first_name;
        lastName = person.last_name;
        email = person.email;

        // method payment
        methodPayment = widget.reservation.methodPayment.toString();
      });
    } catch (e) {
      // ignore: avoid_print
      print("[_getInfoPersonAndShop ]" + e.toString());
    }
  }
}
