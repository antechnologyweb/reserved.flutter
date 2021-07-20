import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Image.asset(
              'assets/images/mainPage.jpg',
              fit: BoxFit.fitHeight,
            ),
            // child: Text('У вас пока нет сообщении'),
          ),
        ),
      ],
    );
  }
}
