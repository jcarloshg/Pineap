import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pineap/Widgets/card_date.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';

class Reservations extends StatefulWidget {
  const Reservations({Key? key}) : super(key: key);

  @override
  _ReservationsState createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  // controles
  TextEditingController birthdayController = TextEditingController();
  TextEditingController typeShopController = TextEditingController();
  DateTime birthday = DateTime.now();

  String dayToSearch = "Hoy";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TitleWidget(title: "Reservaciones"),
              const SubTitle(
                  subtitle: "Pueder ver y crear nuevas reservaciones"),

              // ==============================================
              // button to create new resevacion
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Crear una nueva reservación'),
              ),

              // ==============================================
              // filtro de busqueda
              const SizedBox(height: 16),
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

              // ==============================================
              // fechas de citas

              // add to list ------------ >
              const SizedBox(height: 8),
              const CardDate(),
              const SizedBox(height: 8),
              const CardDate(),
              const SizedBox(height: 8),
              const CardDate(),
            ],
          ),
        ),
      ),
    );
  }

  void _showDataPicker() {
    showDatePicker(
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2222))
        .then((value) {
      birthday = value!;
      birthdayController.text = DateFormat('MMMM dd, yyyy').format(value);
      setState(() => dayToSearch = birthdayController.text);
    });
  }

  _setTypeShop(String value) {
    setState(() => dayToSearch = value);

    if (value == Constants.dateEspecific) {
      _showDataPicker();
    }
  }
}
