import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trading_books/Controllers/notificationController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';

class NotifictionCat extends GetView {
  final int index;
  final String title;
  final void Function() onPressed;
  const NotifictionCat({
    super.key,
    required this.title,
    required this.onPressed,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 5,
        onPressed: onPressed,
        child: GetBuilder<NotificationController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: controller.currentCategories == index
                        ? AppColor.primarycolor
                        : AppColor.grey),
              ),
              Container(
                height: 5,
                width: Get.height / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: controller.currentCategories == index
                      ? AppColor.primarycolor
                      : AppColor.grey,
                ),
              ),
            ],
          );
        }));
  }
}
