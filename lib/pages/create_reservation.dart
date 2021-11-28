import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pineap/Widgets/info_box.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/helpers/validator.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_block_form.dart';
import 'package:pineap/styles/title_widget.dart';

class CreateReservation extends StatefulWidget {
  const CreateReservation({Key? key, required this.shop}) : super(key: key);

  final Shop shop;

  @override
  _CreateReservationState createState() => _CreateReservationState();
}

class _CreateReservationState extends State<CreateReservation> {
  //
  // controles
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerTime = TextEditingController();
  TextEditingController controllerNote = TextEditingController();
  TextEditingController methodPaymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const TitleWidget(title: "Crear nueva resevación"),
                const SubTitle(subtitle: "Llena todos los campos"),

                //
                //
                // info shop
                const SizedBox(height: 32),
                const TitleBlockForm(title_block_form: "Información negocio"),
                InfoBox(icon: const Icon(Icons.house), info: widget.shop.name),
                InfoBox(
                    icon: const Icon(Icons.place), info: widget.shop.address),

                //
                //
                // info client
                const SizedBox(height: 32),
                const TitleBlockForm(
                    title_block_form: "Información del cliente"),
                InfoBox(icon: const Icon(Icons.person), info: widget.shop.name),
                InfoBox(
                    icon: const Icon(Icons.email), info: widget.shop.address),

                //
                //
                // info shop
                const SizedBox(height: 32),
                const TitleBlockForm(
                    title_block_form: "Información de la reservación"),
                TextField(
                  controller: controllerDate,
                  readOnly: true,
                  onTap: _showDataPicker,
                  decoration: InputDecoration(
                    labelText: "Fecha",
                    suffixIcon: IconButton(
                      onPressed: _showDataPicker,
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                TextField(
                  controller: controllerTime,
                  readOnly: true,
                  onTap: () => _showPickSartTime(context: context),
                  decoration: InputDecoration(
                    labelText: "Hora",
                    suffixIcon: IconButton(
                      onPressed: () => _showPickSartTime(context: context),
                      icon: const Icon(Icons.schedule),
                    ),
                  ),
                ),
                TextField(
                  controller: controllerNote,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: "Nota",
                    suffixIcon: Icon(Icons.note),
                  ),
                ),
                TextField(
                  controller: methodPaymentController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tipo de pago",
                    suffixIcon: PopupMenuButton(
                      onSelected: _setTypePayment,
                      icon: const Icon(Icons.arrow_drop_down),
                      itemBuilder: (context) {
                        return Constants.typesMethodPayment.map(
                          (String _selectvalue) {
                            return PopupMenuItem<String>(
                              value: _selectvalue,
                              child: Text(_selectvalue),
                            );
                          },
                        ).toList();
                      },
                    ),
                  ),
                ),

                //
                //
                // button
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: onPressedUploadReservation,
                  child: const Text('Registrar reservacion'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showPickSartTime({required BuildContext context}) async {
    showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    ).then(
      (value) => {
        controllerTime.text = Constants.getFormatTimeOfDay(timeOfDay: value),
      },
    );
  }

  _setTypePayment(String value) {
    String typeShop = "";
    if (Constants.cash == value) typeShop = Constants.cash;
    if (Constants.creditCard == value) typeShop = Constants.creditCard;
    methodPaymentController.text = typeShop;
  }

  _showDataPicker() {
    showDatePicker(
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2222))
        .then((value) {
      DateTime dateTime = value!;
      controllerDate.text = DateFormat('MMMM dd, yyyy').format(dateTime);
    });
  }

  void onPressedUploadReservation() {}
}
