import 'package:flutter/material.dart';
import 'package:pineap/models_class/person_model.dart';
import 'package:pineap/models_class/shop_model.dart';
import 'package:pineap/pages/Login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PersonModel>(create: (_) => PersonModel()),
        Provider<ShopModel>(create: (_) => ShopModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pineap',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
