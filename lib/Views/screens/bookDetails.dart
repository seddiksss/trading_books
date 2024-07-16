import 'package:flutter/material.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: ListView(
        children: [
          Container(
            height: screenHeight / 1.5,
            width: screenHeight / 100,
            decoration: BoxDecoration(
              color: AppColor.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color
                  offset: const Offset(8, 7), // Shadow offset
                  blurRadius: 8, // Shadow blur radius
                ),
              ],
            ),
            child: Image.asset(
              AppImages.book4,
              fit: BoxFit.contain,
              height: screenHeight / 7,
              width: screenHeight / 8,
            ),
          ),
        ],
      ),
    );
  }
}
