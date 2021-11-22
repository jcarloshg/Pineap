import 'package:flutter/material.dart';
import 'package:pineap/Widgets/box_day-hour.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                TitleWidget(title: "Horas de citas"),
                SubTitle(subtitle: "Puedes ver y modificar tus horas de cita"),
                SizedBox(height: 32),
                BoxDayHour(),
                SizedBox(height: 16),
                BoxDayHour(),
                SizedBox(height: 16),
                BoxDayHour(),
                SizedBox(height: 16),
                BoxDayHour(),
                SizedBox(height: 16),
                BoxDayHour(),
                SizedBox(height: 16),
                BoxDayHour(),
                SizedBox(height: 16),
                BoxDayHour(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
