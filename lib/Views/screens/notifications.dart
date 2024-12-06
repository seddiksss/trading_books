import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Controllers/notificationController.dart';
import 'package:trading_books/Views/widgets/notificationWidgets/notificationCat.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GetBuilder<NotificationController>(
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NotifictionCat(
                  title: "MESSAGES",
                  onPressed: () {
                    controller.changeCat(0);
                  },
                  index: 0,
                ),
                NotifictionCat(
                  title: "REQUESTS",
                  onPressed: () {
                    controller.changeCat(1);
                  },
                  index: 1,
                ),
                NotifictionCat(
                    title: "NOTIFICATIONS",
                    onPressed: () {
                      controller.changeCat(2);
                    },
                    index: 2),
              ],
            ),
          ),
          GetBuilder<NotificationController>(
            builder: (controller) => Container(
                child: controller.requestList[controller.currentCategories]),
          ),
        ],
      ),
    );
  }
}
