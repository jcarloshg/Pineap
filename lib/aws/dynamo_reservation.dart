import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
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
    print(TemporalDate(date));
    try {
      List<Reservation> reservationList = (await Amplify.DataStore.query<
              Reservation>(Reservation.classType,
          where: Reservation.METHODPAYMENT.eq(MethodPayment.card.toString())
          // QueryField(fieldName: "Reservation_date").eq(TemporalDate(date)),
          ));

      return reservationList;
    } catch (e) {
      // ignore: avoid_print
      print("[uploadReservation]" + e.toString());
      return null;
    }
  }

  static Future<List<Reservation>?> getAllQuery() async {
    try {
      String graphQLDocument = '''
query MyQuery {
  listReservations {
    items {
      id
      updatedAt
      status
      methodPayment
      hour
      description
      date
      createdAt
      PersonID
      ShopID
      _deleted
      _lastChangedAt
      _version
    }
  }
}
    ''';

      var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
          document: graphQLDocument,
        ),
      );

      var response = await operation.response;
      var data = response.data;

      final otraData = json.decode(data);

      List items = otraData["listReservations"]["items"];

      List<Reservation> listReservation = [];

      for (var element in items) {
        // print(element);
        listReservation.add(Reservation.fromJson(element));
        // print(reservation.toString());
      }

      return listReservation;
    } catch (e) {
      // ignore: avoid_print
      print("[uploadReservation]" + e.toString());
      return null;
    }
  }
}
