import 'dart:convert';

import 'package:btime/models/restaurants_model/restaurants_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepository {
  late SharedPreferences _preferences;
  Set<Restaurant> _restaurants = Set();

  FavoritesRepository() {
    loadPrefs();
  }

  loadPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  addFav(Restaurant object) {
    _restaurants.add(object);
    // _preferences.setString('restaurants', jsonEncode(_restaurants));
    _preferences.setStringList('restaurants',
        _restaurants.map((e) => jsonEncode(e.toJson())).toList());
    return _restaurants;
  }

  removeFav(Restaurant object) {
    _restaurants.remove(object);
    _preferences.setStringList('restaurants',
        _restaurants.map((e) => jsonEncode(e.toJson())).toList());
    // _preferences.setString('restaurants', jsonEncode(_restaurants));
    return _restaurants;
  }

  Future<Set<Restaurant>> loadFromCache() async {
    // var data = await _preferences.setString('restaurants', jsonEncode(_restaurants));
    // print(data);
    var obj = _preferences.getStringList('restaurants');
    if (obj != null)
      obj
          .map((e) => _restaurants.add(Restaurant.fromJson(jsonDecode(e))))
          .toSet();
    // _restaurants = Set.from(
    //     obj!.map((e) => _restaurants.add(Restaurant.fromJson(jsonDecode(e)))));
    return _restaurants;
  }
}
