import 'package:flutter/material.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';
import 'package:trading_books/Core/Constants/mediaquery.dart';
import 'package:trading_books/Views/widgets/profileWidgets/BankCard.dart';

class Paymentmethode extends StatelessWidget {
  const Paymentmethode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil(context: context).screenWidth * 0.08),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColor.primarycolor)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: ScreenUtil(context: context).screenHeight * 0.027,
                horizontal: ScreenUtil(context: context).screenWidth * 0.09),
            child: Row(
              children: [
                Image.asset(
                  AppImages.ImageName("mastercard.png"),
                  height: ScreenUtil(context: context).screenHeight * 0.03,
                ),
                SizedBox(
                  width: ScreenUtil(context: context).screenWidth * 0.07,
                ),
                const Row(
                  children: [
                    Text(
                      "***234\nPayment Method",
                      style: TextStyle(
                          color: AppColor.grey, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
