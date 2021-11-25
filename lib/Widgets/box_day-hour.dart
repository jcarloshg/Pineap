// ignore_for_file: file_names

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_datastore_plugin_interface/src/types/temporal/temporal_time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/models/ModelProvider.dart';

class BoxDayHour extends StatefulWidget {
  BoxDayHour({Key? key, required this.day}) : super(key: key);

  final Day day;

  @override
  _BoxDayHourState createState() => _BoxDayHourState();
}

class _BoxDayHourState extends State<BoxDayHour> {
  // initial times
  late TimeOfDay startTime = const TimeOfDay(hour: 5, minute: 0);
  late TimeOfDay endTime = const TimeOfDay(hour: 23, minute: 0);
  // controllers
  // final String hourStartController = '${startTime.hour.toString()} : ${startTime.minute.toString()}';
  // final String hourEndController = '${endTime?.hour.toString()} : ${endTime?.minute.toString()}';
  final String hourStartController = "";
  final String hourEndController = "";
  String dropdownValue = "Abierto";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.day.dayName),
              DropdownButton<String>(
                value: widget.day.isOpen ? Constants.isOpen : Constants.isClose,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                // style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 0,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: Constants.stateDay
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
                    Text(_getFormatDateTime(widget.day.hour_open)),
                    IconButton(
                      onPressed: () => showPickSartTime(context),
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                    Text(_getFormatDateTime(widget.day.hour_close)),
                    IconButton(
                      onPressed: () => showPickSartTime(context),
                      icon: const Icon(Icons.arrow_drop_down),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> showPickSartTime(BuildContext context) async {
    final timeSelected = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 4, minute: 0),
    );
  }

  Future<void> showPickEndTime({
    required BuildContext context,
    required TimeOfDay initialTime,
  }) async {
    final timeSelected = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    setState(() {
      startTime = timeSelected!;
    });

    // hourEndController.text =
    //     '${timeSelected?.hour.toString()} : ${timeSelected?.minute.toString()}';
  }

  String _getFormatDateTime(TemporalTime? hour) {
    String format = "";
    format = hour.toString();

    final dateTime = DateTime.parse('2021-08-11T$format');
    final dateFormat = DateFormat('HH:mm');
    format = "${dateFormat.format(dateTime)} hrs";

    return format;
  }
}
