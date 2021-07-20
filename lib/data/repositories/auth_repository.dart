import 'dart:async';
import 'dart:convert';

import 'package:btime/models/reservation_model.dart';
import 'package:btime/models/user_model.dart';
import 'package:btime/http_client/http_client.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  Future<List<Booking>?> userBookingHistory(userId) async {
    // final response =
    //     await HttpClientS.get(Uri.https('reserved.org.kz', "/api/categories"));
    final response = await HttpClientS.get(routeEndPoint: 'booking/$userId');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var bookings = List.generate(data['data'].length,
          (index) => Booking.fromJson(data['data'][index]));
      return bookings;
    } else {}
  }

  Future<User?> login(Map<String, dynamic> body) async {
    // if (body['password'].length == 4) {

    final response = await HttpClientS.get(
        routeEndPoint: 'login/${body['phone']}/${body['password']}');
    final data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['data']['api_token']); //save token in prefs
      prefs.setString('token', data['data']['api_token']); //save token in prefs
      // Fluttertoast.showToast(msg: data['message']);
      return User(
          data['data']['id'] as int,
          data['data']['api_token'],
          data['data']['name'],
          data['data']['avatar'] ?? '',
          data['data']['phone']);
    } else {
      // Fluttertoast.showToast(msg: "Не правильный пароль или номер телефона");
      // return User.empty;
      return null;
    }
  }

  Future<User> loginViaToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token'); //save token in prefs
    // if (body['password'].length == 4) {
    final response = await HttpClientS.get(routeEndPoint: 'token/$token');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      prefs.setString('token', data['data']['api_token']); //save token in prefs
      prefs.setInt('token', data['data']['id']); //save token in prefs
      // Fluttertoast.showToast(msg: data['message']);
      return User(
          data['data']['id'] as int,
          data['data']['api_token'],
          data['data']['name'],
          data['data']['avatar'] ?? '',
          data['data']['phone']);
    } else {
      Fluttertoast.showToast(
          msg: "Невозможно зайти с помощью токена, он был удален");
      return User.empty;
    }
    // } else {
    //   Fluttertoast.showToast(msg: "Пароль должен состоять из 4 симолов");
    //   return User.empty;
    // }
  }

  Future<User?> register(Map<String, dynamic> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(body);
    // try {
    final response =
        await HttpClientS.get(routeEndPoint: 'register', query: body);
    final data = jsonDecode(response.body);
      print(response.statusCode);
      prefs.setString('token', data['data']['api_token']);
      prefs.setInt('user_id', data['data']['id']);
      return User(data['data']['id'] as int, data['data']['api_token'],
          data['data']['name'], data['data']['avatar'], data['data']['phone']);
    // } catch (err) {
    //   print(err);
    // }
  }
}

