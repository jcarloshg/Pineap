import 'package:flutter/material.dart';
import 'package:pineap/pages/Client/profile.dart';
import 'package:pineap/pages/Client/reservations.dart';
import 'package:pineap/pages/Client/shops.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';

class HomePageClient extends StatefulWidget {
  const HomePageClient({Key? key}) : super(key: key);

  @override
  _HomePageClientState createState() => _HomePageClientState();
}

class _HomePageClientState extends State<HomePageClient> {
  int currentIndex = 0;
  final screens = [
    Shops(),
    Reservations(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: screens[currentIndex],
      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: const <Widget>[
      //       TitleWidget(title: "homePage"),
      //       SubTitle(subtitle: "gola compa"),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
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
