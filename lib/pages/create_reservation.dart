import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pineap/Widgets/info_box.dart';
import 'package:pineap/aws/dynamo_reservation.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models_class/person_model.dart';
import 'package:pineap/models_class/shop_model.dart';
import 'package:pineap/pages/Client/home_page_client.dart';
import 'package:pineap/styles/messages.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_block_form.dart';
import 'package:pineap/styles/title_widget.dart';
import 'package:provider/provider.dart';

class CreateReservation extends StatefulWidget {
  const CreateReservation({Key? key, required this.shop}) : super(key: key);

  final Shop shop;

  @override
  _CreateReservationState createState() => _CreateReservationState();
}

class _CreateReservationState extends State<CreateReservation> {
  // models
  late PersonModel personModel;
  late ShopModel shopModel;
  //
  int _currentStep = 0;

  //
  // controles
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerTime = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  TextEditingController methodPaymentController = TextEditingController();

  late TimeOfDay hour = TimeOfDay.now();
  late DateTime date = DateTime.now();

  bool isFormComplete = false;

  @override
  Widget build(BuildContext context) {
    personModel = Provider.of<PersonModel>(context);
    shopModel = Provider.of<ShopModel>(context);

    return Scaffold(
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const <Widget>[
                TitleWidget(title: "Crear nueva resevación"),
                SubTitle(subtitle: "Llena todos los campos"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          (isFormComplete)

              //
              //
              // resumen
              ? Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        //
                        //
                        // info negocio
                        const TitleBlockForm(title_block_form: "Negocio"),
                        InfoBox(
                          icon: const Icon(Icons.home),
                          info: widget.shop.name,
                        ),
                        //
                        //
                        // info negocio
                        const SizedBox(height: 32),
                        const TitleBlockForm(
                            title_block_form: "Infomación de la cita"),
                        InfoBox(
                          icon: const Icon(Icons.place),
                          info: widget.shop.address,
                        ),
                        // const TitleBlockForm(title_block_form: "Fecha/Hora"),
                        InfoBox(
                            icon: const Icon(Icons.calendar_today),
                            info: Constants.getFormatDateTime(dateTime: date)),
                        InfoBox(
                          icon: const Icon(Icons.schedule),
                          info: Constants.getFormatTimeOfDay(timeOfDay: hour),
                        ),

                        //
                        //
                        // info cliente
                        const SizedBox(height: 32),
                        const TitleBlockForm(
                            title_block_form: "Infomación del cliente"),
                        InfoBox(
                            icon: const Icon(Icons.person),
                            info:
                                '${personModel.getPerson.first_name} ${personModel.getPerson.last_name}'),
                        InfoBox(
                          icon: const Icon(Icons.email),
                          info: personModel.getPerson.email,
                        ),

                        //
                        //
                        // info reservación
                        const SizedBox(height: 32),
                        const TitleBlockForm(title_block_form: "Descripción"),
                        InfoBox(
                          icon: const Icon(Icons.note),
                          info: controllerDescription.text,
                        ),

                        //
                        //
                        // info reservación
                        const SizedBox(height: 32),
                        const TitleBlockForm(
                            title_block_form: "Método de pago"),
                        InfoBox(
                          icon: const Icon(Icons.credit_card),
                          info: methodPaymentController.text,
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
                )

              //
              //
              // Stepper
              : Flexible(
                  child: Stepper(
                    // type: StepperType.horizontal,
                    currentStep: _currentStep,
                    steps: _steps(),
                    onStepContinue: () {
                      bool isLastStep = (_currentStep == _steps().length - 1);
                      if (isLastStep) {
                        // ignore: avoid_print
                        print("complete!!!!");
                        setState(() => isFormComplete = !isFormComplete);
                      } else {
                        setState(() => _currentStep += 1);
                      }
                    },
                    onStepCancel: () {
                      _currentStep == 0
                          ? null
                          : setState(() => _currentStep -= 1);
                    },
                  ),
                ),
        ],
      ),
    );
  }

  List<Step> _steps() {
    List<Step> listSteps = [
      Step(
        isActive: _currentStep >= 0,
        title: const TitleBlockForm(title_block_form: "Fecha & Hora"),
        content: Column(
          children: <Widget>[
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
              onTap: _showPickSartTime,
              decoration: InputDecoration(
                labelText: "Hora",
                suffixIcon: IconButton(
                  onPressed: _showPickSartTime,
                  icon: const Icon(Icons.schedule),
                ),
              ),
            ),
          ],
        ),
      ),
      Step(
        isActive: _currentStep >= 1,
        title: const TitleBlockForm(title_block_form: "Descripción"),
        content: Column(
          children: <Widget>[
            TextField(
              controller: controllerDescription,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: "Descripción (puede ir vacía)",
                suffixIcon: Icon(Icons.note),
              ),
            ),
          ],
        ),
      ),
      Step(
        isActive: _currentStep >= 2,
        title: const TitleBlockForm(title_block_form: "Método de pago"),
        content: Column(
          children: <Widget>[
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
          ],
        ),
      ),
    ];

    return listSteps;
  }

  _setTypePayment(String value) {
    String typeShop = "";
    if (Constants.cash == value) typeShop = Constants.cash;
    if (Constants.creditCard == value) typeShop = Constants.creditCard;
    methodPaymentController.text = typeShop;
  }

  _showPickSartTime() {
    showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    ).then(
      (value) {
        setState(() => hour = value!);
        controllerTime.text = Constants.getFormatTimeOfDay(timeOfDay: value);
      },
    );
  }

  _showDataPicker() {
    showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2222),
    ).then((value) {
      setState(() => date = value!);
      controllerDate.text = DateFormat('MMMM dd, yyyy').format(date);
    });
  }

  Future<void> onPressedUploadReservation() async {
    MethodPayment methodPayment = MethodPayment.cash;

    //check method payment
    if (Constants.cash == methodPaymentController.text) {
      methodPayment = MethodPayment.cash;
    }
    if (Constants.creditCard == methodPaymentController.text) {
      methodPayment = MethodPayment.card;
    }

    Reservation reservation = Reservation(
      hour: TemporalTime(DateTime(2000, 1, 1, hour.hour - 5, hour.minute)),
      date: TemporalDate(date),
      description: controllerDescription.text,
      methodPayment: methodPayment,
      status: StatusReservation.isNext,
      Shop: widget.shop,
      Person: personModel.getPerson,
    );

    Reservation? reservationResponse =
        await DynamoReservation.uploadReservation(
      reservation: reservation,
    );

    if (reservationResponse != null) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePageClient()));
    } else {
      Messages.scaffoldMessengerWidget(
        context: context,
        message: "No se a podido registrar tu reservación",
      );
    }
  }
}
