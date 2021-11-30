import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pineap/Widgets/card_date.dart';
import 'package:pineap/Widgets/label_with_icon.dart';
import 'package:pineap/aws/dynamo_reservation.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';

class Reservations extends StatefulWidget {
  const Reservations({Key? key}) : super(key: key);

  @override
  _ReservationsState createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  // data to filter
  TextEditingController dateTimeSelectController = TextEditingController();
  DateTime dateTimeSelect = DateTime.now();
  String dayToSearch = "Hoy";

  //
  List<Reservation>? listReservationToday;
  List<Reservation>? listReservationTomorrow;
  List<Reservation>? listReservationNext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getReservations();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const TitleWidget(title: "Reservaciones"),
                const SubTitle(subtitle: "Puedes ver y crear reservaciones"),
                //
                //
                // filtro de busqueda
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    // border: Border.all(color: Colors.black87),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SubTitle(subtitle: "Buscar por"),
                          Row(
                            children: <Widget>[
                              SubTitle(subtitle: dayToSearch),
                              PopupMenuButton(
                                onSelected: _setTypeShop,
                                icon: const Icon(Icons.arrow_drop_down),
                                itemBuilder: (context) {
                                  return Constants.typesDayToSearch.map(
                                    (String _selectvalue) {
                                      return PopupMenuItem<String>(
                                        value: _selectvalue,
                                        child: Text(_selectvalue),
                                      );
                                    },
                                  ).toList();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //
                //
                // list reservations
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const <Widget>[
                    //
                    //
                    // hoy
                    SizedBox(height: 8),
                    LabelWithIcon(iconData: Icons.calendar_today, info: "Hoy"),
                    CardDate(),
                    CardDate(),
                    CardDate(),
                    //
                    //
                    // ma;ana
                    SizedBox(height: 32),
                    LabelWithIcon(
                        iconData: Icons.calendar_today, info: "Mañana"),
                    CardDate(),
                    CardDate(),
                    CardDate(),
                    //
                    //
                    // Todas
                    SizedBox(height: 32),
                    LabelWithIcon(
                        iconData: Icons.calendar_today, info: "Proximas"),
                    CardDate(),
                    CardDate(),
                    CardDate(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setTypeShop(String value) {
    setState(() => dayToSearch = value);

    if (value == Constants.dateEspecific) {
      _showDataPicker();
    }
  }

  void _showDataPicker() {
    showDatePicker(
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2222))
        .then((value) {
      dateTimeSelect = value!;
      dateTimeSelectController.text = DateFormat('MMMM dd, yyyy').format(value);
      setState(() => dayToSearch = dateTimeSelectController.text);
    });
  }

  void _getReservations() async {
    List<Reservation>? reservationResponse =
        await DynamoReservation.getAllQuery();

    reservationResponse?.forEach((reser) => print(reser.toString()));

    setState(() => listReservationToday = reservationResponse);
  }
}
