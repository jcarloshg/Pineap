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
  String dayToSearch = "Mostrar todas";

  List<Reservation>? listReservationToday = [];
  List<Reservation>? listReservationTomorrow = [];
  List<Reservation>? listReservationNext = [];

  @override
  void initState() {
    super.initState();
    _getReservations();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
              // hoy
              if (dayToSearch == Constants.today ||
                  dayToSearch == Constants.showAlls)
                Expanded(
                  child: _showBoxDate(
                      tile: "hoy", listReservation: listReservationToday!),
                ),

              //
              //
              // tomorrow
              if (dayToSearch == Constants.tomorrow ||
                  dayToSearch == Constants.showAlls)
                Expanded(
                  child: _showBoxDate(
                      tile: "Mañana",
                      listReservation: listReservationTomorrow!),
                ),

              //
              //
              // next
              if (dayToSearch == Constants.dateEspecific ||
                  dayToSearch == Constants.showAlls)
                Expanded(
                  child: _showBoxDate(
                      tile: "proximas", listReservation: listReservationNext!),
                ),
            ],
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
        .then((value) async {
      dateTimeSelect = value!;
      dateTimeSelectController.text = DateFormat('MMMM dd, yyyy').format(value);
      setState(() => dayToSearch = dateTimeSelectController.text);

      // get the next reservation
      List<Reservation>? reservationProxima =
          await DynamoReservation.getByDateQuery(date: value);
      setState(() => listReservationNext = reservationProxima);
    });
  }

  void _getReservations() async {
    //
    //
    // get list Reservation Today
    List<Reservation>? reservationToday =
        await DynamoReservation.getByDateQuery(date: DateTime.now());
    setState(() => listReservationToday = reservationToday);

    //
    //
    // get list Reservation Tomorrow
    DateTime today = DateTime.now();
    DateTime tomorrow = DateTime(today.year, today.month, today.day + 1);
    List<Reservation>? reservationTomorrow =
        await DynamoReservation.getByDateQuery(date: tomorrow);
    setState(() => listReservationTomorrow = reservationTomorrow);

    //
    //
    // get list Reservation proximas
    DateTime proximas =
        DateTime(tomorrow.year, tomorrow.month, tomorrow.day + 1);
    List<Reservation>? reservationProxima =
        await DynamoReservation.getByDateQuery(date: proximas);
    setState(() => listReservationNext = reservationProxima);
  }

  Widget _showBoxDate({
    required String tile,
    required List<Reservation> listReservation,
  }) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        LabelWithIcon(iconData: Icons.calendar_today, info: tile),
        Expanded(
          child: ListView.builder(
            itemCount: listReservation.length,
            itemBuilder: (context, index) {
              return CardDate(reservation: listReservation[index]);
            },
          ),
        ),
      ],
    );
  }
}
