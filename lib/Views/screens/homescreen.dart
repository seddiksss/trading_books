import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Views/widgets/customPageButton.dart';

class HomeScreen extends GetView {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GetBuilder<HomeController>(
            builder: (controller) =>
                controller.pageList[controller.currentPag]),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: BottomAppBarWidget(),
        ),
      ],
    ));
  }
}

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // Adjust height as needed
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      // decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image.asset('assets/images/day-with-rain.png'),
          GetBuilder<HomeController>(
              builder: (controller) => CustomPageBotton(
                  title: "Home",
                  iconData: Icons.home,
                  onPressed: () {
                    controller.changePage(0);
                  },
                  index: 0)),
          GetBuilder<HomeController>(
              builder: (controller) => CustomPageBotton(
                  title: "Notifications",
                  iconData: Icons.email,
                  onPressed: () {
                    controller.changePage(1);
                  },
                  index: 1)),
          GetBuilder<HomeController>(
              builder: (controller) => CustomPageBotton(
                  title: "Profile",
                  iconData: Icons.person,
                  onPressed: () {
                    controller.changePage(2);
                  },
                  index: 2))
        ],
      ),
    );
  }
}
