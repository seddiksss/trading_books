import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
<<<<<<< HEAD
=======

>>>>>>> 82f49424540abd95ebe55516a91f3d35ad8d5b31
import 'package:trading_books/Views/widgets/customPageButton.dart';

class HomeScreen extends GetView {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppBar(
        // height: 70,
        child: BottomAppBarWidget(),
      ),
      body: GetBuilder<HomeController>(
          builder: (controller) => controller.pageList[controller.currentPag]),
    );
  }
}

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  title: "Comm",
                  iconData: Icons.browse_gallery,
                  onPressed: () {
                    controller.changePage(1);
                  },
                  index: 1)),
          GetBuilder<HomeController>(
              builder: (controller) => CustomPageBotton(
                  title: "Shelf",
                  iconData: Icons.card_giftcard,
                  onPressed: () {
                    controller.changePage(2);
                  },
                  index: 2)),
          GetBuilder<HomeController>(
              builder: (controller) => CustomPageBotton(
                  title: "Notif",
                  iconData: Icons.email,
                  onPressed: () {
                    controller.changePage(3);
                  },
                  index: 3)),
          GetBuilder<HomeController>(
              builder: (controller) => CustomPageBotton(
                  title: "Prfl",
                  iconData: Icons.person,
                  onPressed: () {
                    controller.changePage(4);
                  },
                  index: 4))
        ],
      ),
    );
  }
}
