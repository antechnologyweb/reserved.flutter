import 'dart:convert';

import 'package:btime/models/restaurants_model/restaurants_model.dart';
import 'package:btime/http_client/http_client.dart';

class RestaurantsRepository {
  Future<List<Restaurant>?> getOrganizationsList(int categoryID, id) async {
    final response = await HttpClientS.get(
      routeEndPoint: 'category/organizations/$id',
      // query: query,
      // token: token
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var restaurants = List.generate(data['data'].length,
          (index) => Restaurant.fromJson(data['data'][index]));
      return restaurants;
    } else {
      print('Restaurant from json');
    }
  }

  getTables(id) async {
    final response = await HttpClientS.get(
      routeEndPoint: 'organizations/$id',
    );
  }
}
