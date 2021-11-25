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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                children: const <Widget>[
                  TitleWidget(title: "Horas de citas"),
                  SubTitle(
                      subtitle: "Puedes ver y modificar tus horas de cita"),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: shopModel.getDays?.length,
                itemBuilder: (context, index) {
                  return BoxDayHour(day: shopModel.getDays![index]);
                },
              ),
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: SingleChildScrollView(
        //     child:
        //   ),
        // ),
      ),
    );
  }
}
