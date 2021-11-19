import 'package:flutter/material.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';

class CodeVerificationShop extends StatefulWidget {
  const CodeVerificationShop({Key? key}) : super(key: key);

  @override
  _CodeVerificationShopState createState() => _CodeVerificationShopState();
}

class _CodeVerificationShopState extends State<CodeVerificationShop> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const TitleWidget(title: "Código verificación"),
            const SubTitle(subtitle: "Tu código debe tener 6 carácteres"),
            const SizedBox(height: 32),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Ingresa tu código"),
                    validator: (String? value) {
                      return value == null ? 'Please enter some text' : null;
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.brown,
                        ),
                      ),
                      onPressed: () {
                        // ignore: avoid_print
                        print("codigo reenviado");
                      },
                      child: const Text("Reenvia tu codigo"),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      // ignore: avoid_print
                      print("Login");
                    },
                    child: const Text('Ingresar'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
