// ignore_for_file: file_names

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pineap/aws/dynamo_day.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models_class/shop_model.dart';
import 'package:pineap/styles/messages.dart';
import 'package:provider/provider.dart';

class BoxDayHour extends StatefulWidget {
  const BoxDayHour({Key? key, required this.day}) : super(key: key);

  final Day day;

  @override
  _BoxDayHourState createState() => _BoxDayHourState();
}

class _BoxDayHourState extends State<BoxDayHour> {
  String dropdownValue = "Abierto";
  late ShopModel shopModel;

  @override
  Widget build(BuildContext context) {
    shopModel = Provider.of<ShopModel>(context);
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
                    Text(_getFormatTemporalTime(widget.day.hour_open)),
                    IconButton(
                      onPressed: () => showPickEndTime(
                          context: context,
                          hourToChanged: widget.day.hour_open),
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                    Text(_getFormatTemporalTime(widget.day.hour_close)),
                    IconButton(
                      onPressed: () => showPickEndTime(
                          context: context,
                          hourToChanged: widget.day.hour_close),
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

  Future<void> showPickSartTime({
    required BuildContext context,
    TemporalTime? hourToChanged,
  }) async {
    showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    ).then(
      (value) => {
        if (value != null)
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: const Text("Cambio de hora"),
              content: Text(
                  "¿Seguro que quiere actulizar su hora de ${_getFormatTemporalTime(hourToChanged)} a ${_getFormatTimeOfDay(timeOfDay: value)}?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop("CANCELAR"),
                    child: const Text("CANCELAR")),
                TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop("ACTUALIZAR");
                      await _updateDay(day: widget.day, timeOfDay: value);
                    },
                    child: const Text("ACTUALIZAR")),
              ],
            ),
          )
      },
    );
  }

  Future<void> showPickEndTime({
    required BuildContext context,
    TemporalTime? hourToChanged,
  }) async {
    showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    ).then(
      (value) => {
        if (value != null)
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: const Text("Cambio de hora"),
              content: Text(
                  "¿Seguro que quiere actulizar su hora de ${_getFormatTemporalTime(hourToChanged)} a ${_getFormatTimeOfDay(timeOfDay: value)}?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop("CANCELAR"),
                    child: const Text("CANCELAR")),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop("ACTUALIZAR");
                    await _updateDay(day: widget.day, timeOfDay: value);
                  },
                  child: const Text("ACTUALIZAR"),
                ),
              ],
            ),
          )
      },
    );
  }

  _updateDay({required Day day, required TimeOfDay timeOfDay}) async {
    // cremaos el día
    DateTime dateTime =
        DateTime(2017, 9, 7, timeOfDay.hour - 5, timeOfDay.minute, 0, 0, 0);

    // copiamos el dia con nuevos datos
    Day dayAux = day.copyWith(hour_close: TemporalTime(dateTime));
    // actulizamos el dia
    final dayResponse = await DynamoDay.updateDay(day: dayAux);

    if (dayResponse != null) {
      Messages.alertDialog(
        context: context,
        message: "Se actualizó la hora correctamente",
      );

      setState(() async {
        List<Day>? days =
            await DynamoDay.getDays(shopid: shopModel.getShop!.getId());
        shopModel.setDays(days: days);
      });
    } else {
      Messages.scaffoldMessengerWidget(
        context: context,
        message: "algo salio mal...",
      );
    }
  }

  String _getFormatTemporalTime(TemporalTime? temporalTime) {
    String format = "";
    format = temporalTime.toString();

    final dateTime = DateTime.parse('2021-08-11T$format');
    final dateFormat = DateFormat('HH:mm');
    format = "${dateFormat.format(dateTime)} hrs";

    return format;
  }

  String _getFormatTimeOfDay({TimeOfDay? timeOfDay}) {
    String format = "";

    if (timeOfDay!.hour < 10) format += "0";
    format += "${timeOfDay.hour}";
    format += ":";
    if (timeOfDay.minute < 10) format += "0";
    format += "${timeOfDay.minute} hrs";

    return format;
  }
}

class Amplify {}
