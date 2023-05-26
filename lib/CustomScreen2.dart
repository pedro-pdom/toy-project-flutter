import 'package:flutter/material.dart';

class CustomScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Personalizada 2'),
      ),
      body: Center(
        child: Text(
          'Esta é a minha tela personalizada 2!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}