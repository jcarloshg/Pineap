import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pineap/Widgets/show_loading.dart';
import 'package:pineap/helpers/constants.dart';
import 'package:pineap/helpers/validator.dart';
import 'package:pineap/models/person_model.dart';
import 'package:pineap/models/shop_model.dart';
import 'package:pineap/pages/Register/register_shops/code_verification_shop.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_block_form.dart';
import 'package:pineap/styles/title_widget.dart';
import 'package:provider/provider.dart';

class FormCreateAcountShops extends StatefulWidget {
  const FormCreateAcountShops({Key? key}) : super(key: key);

  @override
  _FormCreateAcountShopsState createState() => _FormCreateAcountShopsState();
}

class _FormCreateAcountShopsState extends State<FormCreateAcountShops> {
  // data to form
  final _formKey = GlobalKey<FormState>();
  // to show show_loading
  bool isSignUpComplete = false;
  bool isChecked = false;
  bool showPass = false;
  final birthdayController = TextEditingController();
  // data from person
  String lastName = "";
  String firstName = "";
  DateTime birthday = DateTime.now();
  // data from user
  String email = "";
  String pass = "";
  // data from user
  String nameShop = "";
  String addresShop = "";
  String typeShop = 'Restaurante';

  // auxiliares
  String dropdownValue = 'Restaurante';
  List<String> typoshops = [
    'Restaurante',
    'Barberias',
    'Dentista',
    'Lavanderia',
    'Otro'
  ];

  @override
  Widget build(BuildContext context) {
    return isSignUpComplete
        ? ShowLoading(message: "Registrando perfil...")
        : Scaffold(
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
                    const TitleWidget(
                        title: "Crear una cuenta para tu negocio"),
                    const SubTitle(
                        subtitle: "Ingrese datos en todos los campos"),
                    const SizedBox(height: 32),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const TitleBlockForm(
                              title_block_form:
                                  "Información personal del titular"),
                          TextFormField(
                            onSaved: (value) => lastName = value!,
                            decoration:
                                const InputDecoration(labelText: "Apellidos"),
                            validator: (String? value) {
                              return Validator().validate_name(value!)
                                  ? null
                                  : 'Ingresa solo caracteres';
                            },
                          ),
                          TextFormField(
                            onSaved: (value) => firstName = value!,
                            decoration:
                                const InputDecoration(labelText: "Nombre"),
                            validator: (String? value) {
                              return Validator().validate_name(value!)
                                  ? null
                                  : 'Ingresa solo caracteres';
                            },
                          ),
                          TextFormField(
                            controller: birthdayController,
                            readOnly: true,
                            onTap: () => _showDataPicker(),
                            decoration: InputDecoration(
                              labelText: "Fecha nacimiento",
                              suffixIcon: IconButton(
                                onPressed: () => _showDataPicker(),
                                icon: const Icon(Icons.calendar_today),
                              ),
                            ),
                            validator: (String? value) {
                              return value == null
                                  ? 'Please enter some text'
                                  : null;
                            },
                          ),
                          const SizedBox(height: 32),
                          const TitleBlockForm(
                              title_block_form: "Información usuario"),
                          TextFormField(
                            onSaved: (value) => email = value!,
                            decoration: const InputDecoration(
                                labelText: "correo electronico"),
                            validator: (String? value) {
                              return Validator().validate_email(value!)
                                  ? null
                                  : 'Debe tener la estructura "example@email.com"';
                            },
                          ),
                          TextFormField(
                            obscureText: !showPass,
                            onSaved: (value) => pass = value!,
                            decoration: InputDecoration(
                              labelText: "contraseña",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPass = !showPass;
                                  });
                                },
                                icon: Icon(showPass
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined),
                              ),
                            ),
                            validator: (String? value) {
                              return Validator().validate_pass(value!)
                                  ? null
                                  : 'Debe ser alfanumerico y mayor a 8 caracteres';
                            },
                          ),
                          const SizedBox(height: 32),
                          const TitleBlockForm(
                              title_block_form: "Información Negocio"),
                          TextFormField(
                            onSaved: (value) => nameShop = value!,
                            decoration:
                                const InputDecoration(labelText: "Nombre"),
                            validator: (String? value) {
                              return Validator().validate_name(value!)
                                  ? null
                                  : 'Ingresa solo caracteres';
                            },
                          ),
                          Row(
                            children: <Widget>[
                              Text(dropdownValue),
                              DropdownButton<String>(
                                // value: dropdownValue,
                                alignment: Alignment.bottomRight,
                                icon: const Icon(Icons.arrow_downward),
                                underline: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: typoshops.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          TextFormField(
                            onSaved: (value) => addresShop = value!,
                            onTap: () {},
                            decoration: InputDecoration(
                              labelText: "Dirección de local",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.location_city),
                              ),
                            ),
                            validator: (String? value) {
                              return value == null
                                  ? 'Please enter some text'
                                  : null;
                            },
                          ),
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
                            onPressed: () => _onPressed_registred(),
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

  _showDataPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2222))
        .then((value) {
      birthday = value!;
      birthdayController.text = DateFormat('yyyy MMMM dd').format(value);
    });
  }

  // ignore: non_constant_identifier_names
  void _register_a_user() async {
    setState(() {
      isSignUpComplete = false;
    });
    try {
      setState(() {
        isSignUpComplete = true;
      });
      Map<String, String> userAttributes = {
        'email': email,
        // additional attributes as needed
      };
      SignUpResult res = await Amplify.Auth.signUp(
        username: email,
        password: pass,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      setState(() {
        isSignUpComplete = res.isSignUpComplete;
      });
    } on AuthException catch (e) {
      // ignore: avoid_print
      print(e.message);
      if (e.message == "Username already exists in the system.") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('El correo ya fue registrado'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
    setState(() {
      isSignUpComplete = true;
    });
  }

  void _onPressed_registred() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Provider.of<PersonModel>(context, listen: false).setData(
          firstName: firstName,
          lastName: lastName,
          birthday: birthday,
          email: email,
          password: pass,
          role: Constants().MANAGER);

      Provider.of<ShopModel>(context, listen: false).setDate(
          name: nameShop,
          idPhoto: "adsd",
          addres: addresShop,
          typeShop: typeShop);

      if (!isChecked) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Debes aceptar terminos y condiciones'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      _register_a_user();

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CodeVerificationShop()));
    }
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
