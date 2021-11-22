import 'package:flutter/material.dart';
import 'package:pineap/models_class/person_model.dart';
import 'package:pineap/styles/sub_title_widget.dart';
import 'package:pineap/styles/title_widget.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late PersonModel personModel;

  @override
  Widget build(BuildContext context) {
    personModel = Provider.of<PersonModel>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const TitleWidget(title: "Profile"),
              const SubTitle(subtitle: "Profile"),
              Text(personModel.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
