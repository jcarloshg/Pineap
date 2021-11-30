import 'package:flutter/material.dart';
import 'package:pineap/Widgets/info_box.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_block_form.dart';
import 'package:pineap/styles/title_widget.dart';

class InfoReservation extends StatefulWidget {
  const InfoReservation({Key? key}) : super(key: key);

  @override
  _InfoReservationState createState() => _InfoReservationState();
}

class _InfoReservationState extends State<InfoReservation> {
  // info shop
  final String titleShop = "Barber shops";
  final bool isOpen = true;
  final String isOpenString = Constants.isOpen;
  final String uriPhoto = "assets/images/backgorundlogin.jpg";
  // info reservation
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
}
