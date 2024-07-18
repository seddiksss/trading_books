import 'package:flutter/material.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';

class Bankcard extends StatelessWidget {
  const Bankcard(
      {super.key,
      required this.fulname,
      required this.month,
      required this.year,
      required this.CardNumber});
  final String fulname;
  final String month;
  final String year;
  final String CardNumber;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 55),
      height: screenHeight * 0.22,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColor.black, Color.fromARGB(255, 79, 73, 73)],
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: screenHeight * 0.01,
              right: screenWidth * 0.03,
            ),
            alignment: Alignment.bottomRight,
            child: Image.asset(
              AppImages.ImageName('mastercard.png'),
              height: screenHeight * 0.03,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.07,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Row(
              children: [
                Text(
                  "$fulname",
                  style: const TextStyle(color: AppColor.white),
                ),
                SizedBox(
                  width: screenWidth * 0.39,
                ),
                Text(
                  "$month/$year",
                  style: const TextStyle(
                    color: AppColor.white,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Text(
                CardNumber,
                style: const TextStyle(color: AppColor.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
