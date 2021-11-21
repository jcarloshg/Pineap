import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models_class/person_model.dart';

class DynamoPerson {
  static Future<String?> uploadPerson(PersonModel personModel) async {
    Person person = Person(
        last_name: personModel.lastName,
        first_name: personModel.firstName,
        birthday: TemporalDateTime(personModel.birthday),
        role: personModel.role);

    try {
      await Amplify.DataStore.save(person);
    } catch (e) {
      // ignore: avoid_print
      print("[uploadPerson]" + e.toString());
      return null;
    }
    return person.toString();
  }
}