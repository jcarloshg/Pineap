import 'package:pineap/models/ModelProvider.dart';
import 'package:pineap/models/Reservation.dart';
import 'package:amplify_flutter/amplify.dart';

class DynamoReservation {
  static Future<Reservation?> uploadReservation(
      {required Reservation reservation}) async {
    try {
      await Amplify.DataStore.save(reservation);
    } catch (e) {
      // ignore: avoid_print
      print("[uploadReservation]" + e.toString());
      return null;
    }
    return reservation;
  }
}
