import 'dart:convert';

import 'package:btime/bloc/paycards_bloc/payment_cards_bloc.dart';
import 'package:btime/http_client/http_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CardWebViewForm extends StatefulWidget {
  final int? id;
  const CardWebViewForm({Key? key,required this.id}) : super(key: key);

  @override
  _CardWebViewFormState createState() => _CardWebViewFormState();
}

class _CardWebViewFormState extends State<CardWebViewForm> {
  String? url;

  getUrl()async{
    var response = await HttpClientS.get(routeEndPoint: 'payment/card/${widget.id}');
    print(response.body.toString());
    // var data = jsonDecode(response.body);
    url = response.body;
    print(url);
    print(response.body);
    setState(() {

    });
  }
  @override
  void initState() {
    getUrl();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: url==null?Center(child: CircularProgressIndicator()):WebView(
        navigationDelegate: (NavigationRequest request) {
          if (request.url.endsWith('api/payment/card/back')) {
            BlocProvider.of<PaymentCardsBloc>(context).add(LoadPaymentCards(widget.id!));
            Navigator.of(context).pop();
            Fluttertoast.showToast(msg: 'Карта добавлена!');
            return NavigationDecision.navigate;
          }else if (request.url.endsWith('res=error')) {
            Fluttertoast.showToast(msg: 'Ошибка при обработке');
            return NavigationDecision.navigate;
          }
          return NavigationDecision.navigate;
        },
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      )),
    );
  }
}
