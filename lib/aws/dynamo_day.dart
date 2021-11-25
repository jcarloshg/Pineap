import 'package:amplify_flutter/amplify.dart';
import 'package:pineap/models/ModelProvider.dart';

class DynamoDay {
  static Future<Day?> uploadDay({required Day day}) async {
    try {
      await Amplify.DataStore.save(day);
    } catch (e) {
      // ignore: avoid_print
      print("[uploadDay] " + e.toString());
      return null;
    }
    return day;
  }
}
