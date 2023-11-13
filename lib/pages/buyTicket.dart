import 'package:flutter/material.dart';

class BuyTicket extends StatelessWidget {
  const BuyTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text('BUY YOUR TICKET HERE'),
      ),
    );
  }
}
