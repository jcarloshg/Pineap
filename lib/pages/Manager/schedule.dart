import 'package:flutter/material.dart';
import 'package:pineap/Widgets/box_day-hour.dart';
import 'package:pineap/models_class/shop_model.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';
import 'package:provider/provider.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  late ShopModel shopModel;

  @override
  Widget build(BuildContext context) {
    shopModel = Provider.of<ShopModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const TitleWidget(title: "Horas de citas"),
                const SubTitle(subtitle: "Puedes ver y modificar tus horas de cita"),

                TitleWidget(title: shopModel.addres),

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
