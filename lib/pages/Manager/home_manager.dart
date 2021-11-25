import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:pineap/aws/cognito.dart';
import 'package:pineap/aws/dynamo_person.dart';
import 'package:pineap/models/ModelProvider.dart';
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

  

  _getInfo_user_and_shop() async {
    String? userEmail = await Cognito.getCurrentUserEmail(context: context);
    if (userEmail == null) return;

    Person? person = await DynamoPerson.getPerson(userEmail: userEmail);
    if (person == null) return;
    print(person.toString());

    Shop? shop = (await Amplify.DataStore.query(
      Shop.classType,
      where: Shop.PERSON.eq(person.id),
    ))[0];
    if (shop == null) return;
    print(shop.getId());

    List<Day> listDay = await Amplify.DataStore.query(
      Day.classType,
      where: Day.SHOP.eq(shop.getId()),
    );

    listDay.forEach((element) {
      print(element.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_day),
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
