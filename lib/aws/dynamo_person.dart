import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models_class/person_model.dart';

class DynamoPerson {
  static Future<Person?> uploadPerson({
    required PersonModel personModel,
  }) async {
    Person person = Person(
      last_name: personModel.lastName,
      first_name: personModel.firstName,
      birthday: TemporalDateTime(personModel.birthday),
      role: personModel.role,
      email: personModel.email,
    );

    try {
      await Amplify.DataStore.save(person);
    } catch (e) {
      // ignore: avoid_print
      print("[uploadPerson]" + e.toString());
      return null;
    }
    return person;
  }

  static Future<Person?> getPerson({required String userEmail}) async {
    try {
      List<Person> personResponse = (await Amplify.DataStore.query<Person>(
        Person.classType,
        where: Person.EMAIL.eq(userEmail),
      ));

      return personResponse[0];
    } catch (e) {
      // ignore: avoid_print
      print("[getPerson]" + e.toString());
    }

    return null;
  }

  static Future<Person?> getByID({required String id}) async {
    try {
      List<Person> personResponse = (await Amplify.DataStore.query<Person>(
        Person.classType,
        where: Person.ID.eq(id),
      ));

      return personResponse[0];
    } catch (e) {
      // ignore: avoid_print
      print("[getPerson]" + e.toString());
    }

    return null;
  }

}
