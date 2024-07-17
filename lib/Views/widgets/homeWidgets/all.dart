import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Views/widgets/bookCardHome.dart';

class All extends GetView<HomeController> {
  const All({super.key});

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
            onTap: () {
              controller.goToBookDetails();
            },
            color: Colors.blueAccent,
            picture: "assets/images/book2.png",
            title: "ANNUAL REPORT",
            prix: "120 DH",
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book2.png",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book2.png",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book2.png",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book2.png",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book2.png",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book2.png",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book2.png",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book2.png",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
          BookCardHome(
            color: Colors.blueAccent,
            picture: "assets/images/book2.png",
            title: "ANNUAL REPORT",
            prix: "120 DH",
            onTap: () {},
          ),
        ]);
  }
}
