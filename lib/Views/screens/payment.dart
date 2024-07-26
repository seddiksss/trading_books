import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Views/widgets/profileWidgets/BankCard.dart';
import 'package:trading_books/Views/widgets/profileWidgets/paymentMethode.dart';

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
          const Bankcard(
            fulname: "omar baizou",
            year: "29",
            month: "12",
            CardNumber: "1234 1234 1234 1234",
          ),
          SizedBox(
            height: screenheight * 0.018,
          ),
          const Paymentmethode(),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenwidth * 0.1, vertical: screenheight * 0.03),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Card Number",
                        hintStyle: TextStyle(color: AppColor.grey)),
                  ),
                  SizedBox(
                    height: screenheight * 0.03,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Exp Month",
                              hintStyle: TextStyle(color: AppColor.grey)),
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * 0.1,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Exp Year",
                              hintStyle: TextStyle(color: AppColor.grey)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenheight * 0.03,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "CVV",
                        hintStyle: TextStyle(color: AppColor.grey)),
                  ),
                ],
              )),
          SizedBox(
            height: screenheight * 0.03,
          ),
          MaterialButton(
              height: Get.height / 20,
              color: AppColor.primarycolor,
              child: const Text(
                "+   Add",
                style: TextStyle(color: AppColor.white, fontSize: 17),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
