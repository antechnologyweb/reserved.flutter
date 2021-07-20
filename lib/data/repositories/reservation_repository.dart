import 'dart:convert';

import 'package:btime/http_client/http_client.dart';
import 'package:btime/models/categories_model/categories_model.dart';
import 'package:btime/models/reservation_model.dart';

class ReservationRepository {
  const ReservationRepository();
  Future<List<OrganizationSector>?> getTables(organizationId) async {
    final response = await HttpClientS.get(
        routeEndPoint: 'organization/section/$organizationId');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      try {
        var sectors = List.generate(data['data'].length,
            (index) => OrganizationSector.fromJson(data['data'][index]));
        return sectors;
      } catch (err) {
        print(err);
      }
    } else {
      print('OrganizationSector error');
    }
  }

  Future<List<Booking>?> loadOrganizationBookings(organizationId) async {
    final response = await HttpClientS.get(
        routeEndPoint: 'organization/booking/$organizationId');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      try {
        var sectors = List.generate(data['data'].length,
            (index) => Booking.fromJson(data['data'][index]));
        return sectors;
      } catch (err) {
        print(err);
        return [];
      }
    } else {}
  }

  Future<List<Categories>?> userBookingHistory(userId) async {
    // final response =
    //     await HttpClientS.get(Uri.https('reserved.org.kz', "/api/categories"));
    final response = await HttpClientS.get(routeEndPoint: 'categories');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var categories = List.generate(data['data'].length,
          (index) => Categories.fromJson(data['data'][index]));
      return categories;
    } else {}
  }

  makeReservation(body) async {
    print(body);
    // final response =
    //     await HttpClientS.get(Uri.https('reserved.org.kz', "/api/categories"));
    final response =
        await HttpClientS.post(routeEndPoint: 'booking/create', body: body);
    // print('reserveBooking response: ${response.body}');
    var data = jsonDecode(response.body);
    print(data);
    if(data['data']['id']!=null&&data['data']['payment']!=null){
      return data['data']['id'];
    }
    return null;
  }
}
