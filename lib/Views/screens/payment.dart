import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Views/widgets/homeWidgets/BankCard.dart';
import 'package:trading_books/Views/widgets/profilTextfield.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenwidth = mediaQuery.size.width;
    final screenheight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Bankcard(
            fulname: "omar baizou",
            year: "29",
            month: "06",
            CardNumber: "1234 1234 1234 1234",
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenwidth * 0.1, vertical: screenheight * 0.03),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: "Card Number"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Card Number"),
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * 0.1,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Card Number"),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Card Number"),
                  ),
                ],
              )),
          MaterialButton(
              height: Get.height / 20,
              color: AppColor.primarycolor,
              child: const Text(
                "Confirm",
                style: TextStyle(color: AppColor.white, fontSize: 17),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
