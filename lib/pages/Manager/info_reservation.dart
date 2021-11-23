import 'package:flutter/material.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';

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
                if (title != null) Text(title!, style: TextStyle(),),
                if (icon != null) icon!,
                Text(info),
              ],
            ))
      ],
    );
  }
}

class InfoReservation extends StatefulWidget {
  const InfoReservation({Key? key}) : super(key: key);

  @override
  _InfoReservationState createState() => _InfoReservationState();
}

class _InfoReservationState extends State<InfoReservation> {
  // info shop
  final String titleShop = "Barber shops";
  final bool isOpen = true;
  final String isOpenString = Constants.isClose;
  // info reservation
  final String uriPhoto = "assets/images/backgorundlogin.jpg";
  final String address = "C. Vicente Guerrero #40, Col. Rosas del Tepeyac ";
  final String date = "November 21, 2021";
  final String dateTime = "10:00 pm";
  // info user
  final String firstName = "Jose Carlos";
  final String lastName = "Huerta";
  final String email = "carlosj12336@gmail.com";
  // method payment
  final String methodPayment = Constants.cash;

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TitleWidget(title: "Información de la reservación"),
              const SubTitle(subtitle: "Información detallada"),
              const SizedBox(height: 32),
              Image(image: AssetImage(uriPhoto)),
              const SizedBox(height: 16),
              //
              // name shop
              InfoBox(title: titleShop, info: isOpenString),
              //
              // info general
              const SizedBox(height: 16),
              const SubTitle(subtitle: "Información general"),
              InfoBox(icon: const Icon(Icons.place), info: address),
              InfoBox(icon: const Icon(Icons.calendar_today), info: date),
              InfoBox(icon: const Icon(Icons.schedule), info: dateTime),
              //
              // info general
              const SizedBox(height: 16),
              const SubTitle(subtitle: "Información usuario"),
              InfoBox(
                  icon: const Icon(Icons.person), info: '$firstName $lastName'),
              InfoBox(icon: const Icon(Icons.email), info: email),
              //
              // info general
              const SizedBox(height: 16),
              const SubTitle(subtitle: "Método de pago"),
              InfoBox(icon: const Icon(Icons.credit_card), info: methodPayment),
            ],
          ),
        ),
      ),
    );
  }
}
