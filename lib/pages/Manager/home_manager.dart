import 'package:flutter/material.dart';
import 'package:pineap/pages/Manager/profile.dart';
import 'package:pineap/pages/Manager/reservations.dart';
import 'package:pineap/pages/Manager/schedule.dart';

class HomeManagerPage extends StatefulWidget {
  const HomeManagerPage({Key? key}) : super(key: key);

  @override
  _HomeManagerPageState createState() => _HomeManagerPageState();
}

class _HomeManagerPageState extends State<HomeManagerPage> {
  int currentIndex = 0;
  final screens = [
    const Schedule(),
    const Reservations(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Horarios",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Resevraciones",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          )
        ],
      ),
    );
  }
}
