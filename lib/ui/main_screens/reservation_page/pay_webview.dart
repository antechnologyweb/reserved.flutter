import 'package:btime/ui/main_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  final String url;

  const PaymentPage({Key? key, required this.url}) : super(key: key);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var token;
  var userId;

  getData()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    userId = pref.getInt('user_id');
    userId = pref.getString('token');

  }
  @override
  void initState() {
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        navigationDelegate: (NavigationRequest request) {
          print(request.url);
          if (request.url.endsWith('card/success')) {
            Fluttertoast.showToast(msg: 'Бронирование завершено!');
            // var user =
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => MainPages(
                      token: token,
                      userId: userId,
                    )),
                    (route) => false);
            return NavigationDecision.navigate;
          } else if (request.url.endsWith('error')) {
            Fluttertoast.showToast(msg: 'Ошибка при оплате');
            return NavigationDecision.navigate;
          }
          return NavigationDecision.navigate;
        },
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.url,
      ),
    );
  }
}
