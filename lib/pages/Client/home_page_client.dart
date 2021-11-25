import 'package:flutter/material.dart';
import 'package:pineap/models_class/person_model.dart';
import 'package:pineap/models_class/shop_model.dart';
import 'package:pineap/pages/Client/profile.dart';
import 'package:pineap/pages/Client/reservations.dart';
import 'package:pineap/pages/Client/shops.dart';
import 'package:provider/provider.dart';

class HomePageClient extends StatefulWidget {
  const HomePageClient({Key? key}) : super(key: key);

  @override
  _HomePageClientState createState() => _HomePageClientState();
}

class _HomePageClientState extends State<HomePageClient> {
  int currentIndex = 0;
  final screens = [
    const Shops(),
    const Reservations(),
    const Profile(),
  ];
  // orivider
  late PersonModel personModel;
  late ShopModel shopModel;

  @override
  Widget build(BuildContext context) {
    personModel = Provider.of<PersonModel>(context);
    shopModel = Provider.of<ShopModel>(context);

    return Scaffold(
      //appBar: AppBar(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Negocios",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Reservaciones",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
