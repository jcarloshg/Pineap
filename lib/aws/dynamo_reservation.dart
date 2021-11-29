import 'package:amplify_datastore/amplify_datastore.dart';
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

  static Future<List<Reservation>?> getall() async {
    try {
      List<Reservation> reservationList =
          await Amplify.DataStore.query<Reservation>(Reservation.classType);

      return reservationList;
    } catch (e) {
      // ignore: avoid_print
      print("[getall]" + e.toString());
      return null;
    }
  }

  static Future<List<Reservation>?> getByDate({required DateTime date}) async {
    try {
      List<Reservation> reservationList =
          (await Amplify.DataStore.query<Reservation>(
        Reservation.classType,
        where: QueryField(fieldName: "Reservation_date").eq(TemporalDate(date)),
      ));

      return reservationList;
    } catch (e) {
      // ignore: avoid_print
      print("[uploadReservation]" + e.toString());
      return null;
    }
  }
}
