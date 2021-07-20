import 'dart:convert';

import 'package:btime/models/categories_model/categories_model.dart';
import 'package:btime/http_client/http_client.dart';

class CategoryRepository {
  Future<List<Categories>?> getCategory() async {
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
}
