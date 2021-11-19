import 'package:flutter/material.dart';
import 'package:pineap/pages/Register/register_shops/code_verification_shop.dart';
import 'package:pineap/pages/helpers/validator.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_block_form.dart';
import 'package:pineap/styles/title_widget.dart';

class FormCreateAcountShops extends StatefulWidget {
  const FormCreateAcountShops({Key? key}) : super(key: key);

  @override
  _FormCreateAcountShopsState createState() => _FormCreateAcountShopsState();
}

class _FormCreateAcountShopsState extends State<FormCreateAcountShops> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TitleWidget(title: "Crear una cuenta para tu negocio"),
              const SubTitle(subtitle: "Ingrese datos en todos los campos"),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const TitleBlockForm(
                        title_block_form: "Información personal del titular"),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Apellidos"),
                      validator: (String? value) {
                        return Validator().validate_name(value!)
                            ? null
                            : 'Ingresa solo caracteres';
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Nombre"),
                      validator: (String? value) {
                        return Validator().validate_name(value!)
                            ? null
                            : 'Ingresa solo caracteres';
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Fecha nacimiento",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_today),
                        ),
                      ),
                      validator: (String? value) {
                        return value == null ? 'Please enter some text' : null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const TitleBlockForm(
                        title_block_form: "Información usuario"),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "correo electronico"),
                      validator: (String? value) {
                        return Validator().validate_email(value!)
                            ? null
                            : 'Debe tener la estructura "example@email.com"';
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "contraseña",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                      ),
                      validator: (String? value) {
                        return Validator().validate_pass(value!)
                            ? null
                            : 'Debe ser alfanumerico y mayor a 4 caracteres';
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const Text("Aceptar terminos y condiciones"),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>
                        //         const CodeVerificationShop()));
                      },
                      child: const Text('Registrarse'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.brown;
  }
}
