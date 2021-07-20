import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Политика конфиденциальности',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: WebView(
          initialUrl: 'https://reserved.org.kz/contacts/privacy',
        ),
      )),
    );
  }
}

class Contracts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Договор оферты'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: WebView(
          initialUrl: 'https://reserved.org.kz/contacts/contracts',
        ),
      )),
    );
  }
}
