import 'package:flutter/material.dart';
import 'package:trading_books/Views/widgets/bookCardHome.dart';

class Exchange extends StatelessWidget {
  const Exchange({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return GridView.count(
        childAspectRatio: screenHeight / 1273,
        mainAxisSpacing: screenHeight / 20,
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          BookCardHome(
            onTap: () {},
            color: Colors.blueAccent,
            picture: "assets/images/book4.webp",
            title: "ANNUAL REPORT",
            prix: "120 DH",
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book4.webp",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book4.webp",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book4.webp",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book4.webp",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book4.webp",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book4.webp",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book4.webp",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book4.webp",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book4.webp",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
        ]);
  }
}
