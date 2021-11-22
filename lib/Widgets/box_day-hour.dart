// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pineap/helpers/constants.dart';

class BoxDayHour extends StatefulWidget {
  const BoxDayHour({Key? key}) : super(key: key);

  @override
  _BoxDayHourState createState() => _BoxDayHourState();
}

class _BoxDayHourState extends State<BoxDayHour> {
  final _day = "Monday";
  // initial times
  final startTime = const TimeOfDay(hour: 5, minute: 0);
  final endTime = const TimeOfDay(hour: 23, minute: 0);
  // controllers
  final hourStartController = TextEditingController();
  final hourEndController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(_day),
            PopupMenuButton(
              onSelected: setStateDay,
              icon: const Icon(Icons.arrow_drop_down),
              itemBuilder: (context) {
                return Constants.stateDay.map(
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
        Container(
          padding: const EdgeInsets.only(left: 8.0),
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
              const Icon(Icons.lock_clock),
              Row(
                children: <Widget>[
                  Text(hourStartController.text),
                  IconButton(
                    onPressed: () => showPickSartTime(context),
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                  Text(hourEndController.text),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> showPickSartTime(BuildContext context) async {
    final timeSelected = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 4, minute: 0),
    ).then(
      (value) => hourStartController.text = value.toString(),
    );
  }

  Future<void> showPickEndTime({
    required BuildContext context,
    required TimeOfDay initialTime,
  }) async {
    final timeDay = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    hourEndController.text =
        '${timeDay?.hour.toString()} : ${timeDay?.minute.toString()}';
  }

  void setStateDay(String value) {
    String stateDay = "";
    if (Constants.barberiaSHOP == value) stateDay = Constants.barberiaSHOP;
    if (Constants.dentistaSHOP == value) stateDay = Constants.dentistaSHOP;
  }
}
