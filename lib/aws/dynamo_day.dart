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

  static Future<Day?> updateDay({required Day day}) async {
    try {
      await Amplify.DataStore.save(day);
    } catch (e) {
      // ignore: avoid_print
      print("[uploadDay] " + e.toString());
      return null;
    }
    return day;
  }

  static Future<List<Day>?> getDays({required String shopid}) async {
    try {
      List<Day> days = await Amplify.DataStore.query(
        Day.classType,
        where: Day.SHOP.eq(shopid),
      );
      for (var element in days) {
        // ignore: avoid_print
        print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
            element.toString());
      }
      return days;
    } catch (e) {
      // ignore: avoid_print
      print(
          "[getDays                                        ] " + e.toString());
      return null;
    }
  }
}
