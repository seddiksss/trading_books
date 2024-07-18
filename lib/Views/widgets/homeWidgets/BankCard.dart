import 'package:flutter/material.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';

class Bankcard extends StatelessWidget {
  const Bankcard({super.key});
  // final String firstname;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 55),
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.black, const Color.fromARGB(255, 79, 73, 73)],
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
          Row(
            children: [
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Text(
                "Omar",
                style: TextStyle(color: AppColor.white),
              ),
              SizedBox(
                width: screenWidth * 0.01,
              ),
              Text(
                "Baizou",
                style: TextStyle(color: AppColor.white),
              ),
              SizedBox(
                width: screenWidth * 0.3,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "06/23",
                  style: TextStyle(color: AppColor.white),
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Text(
                "1234 5678 9123 4567",
                style: TextStyle(color: AppColor.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
