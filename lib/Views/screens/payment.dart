import 'package:flutter/material.dart';
import 'package:trading_books/Views/widgets/homeWidgets/BankCard.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: ListView(
        children: [Bankcard()],
      ),
    );
  }
}
