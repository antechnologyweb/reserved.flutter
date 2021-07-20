import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

class HttpClientS {
  static const host = 'reserved.org.kz';

  static Future<Response> get(
      {required String routeEndPoint, Map<String, dynamic>? query}) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    // print('token is :$token');
    final response = await http.get(
      Uri.https(host, "/api/$routeEndPoint", query),
      headers: {
        "Content-Type": "application/json",
        // "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  static Future<Response> post({
    required String routeEndPoint,
    Map<String, dynamic>? body,
    // String? token
  }) async {
    // print('token is :$token');
    var s = jsonEncode(body);

    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    final response = await http.post(
      Uri.https(host, "/api/$routeEndPoint"),
      body: s,
      headers: {
        "Content-Type": "application/json",
        // "Authorization": "Bearer $token"
      },
    );
    return response;
  }
}

// class ReservedHttp extends HttpOverrides {
//   static const host = 'reserved.org.kz';
//   // final _fileURL = 'https://b-time.a-lux.dev/storage/';
//
//   static Future<http.Response> get(
//       {required String routeEndPoint,
//       Map<String, dynamic>? query,
//       String? token}) async {
//     print('token is :$token');
//     final response = await http.get(
//       Uri.https(host, "/api/$routeEndPoint", query),
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token"
//       },
//     );
//     return response;
//   }
//
//   static Future<http.Response> post({
//     required String routeEndPoint,
//     Map<String, dynamic>? body,
//     // String? token
//   }) async {
//     // print('token is :$token');
//     print('body is :$body');
//     print('endpoint is :$routeEndPoint');
//     final response = await http.post(
//       Uri.https(host, "/api/$routeEndPoint"),
//       body: body,
//       headers: {
//         "Accept": "application/json",
//         // "Authorization": "Bearer $token"
//       },
//     );
//     print(response.body);
//     return response;
//   }
// }
