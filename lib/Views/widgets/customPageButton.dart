import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';

class CustomPageBotton extends GetView {
  final int index;
  final String title;
  final IconData iconData;
  final void Function() onPressed;
  const CustomPageBotton(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onPressed,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 5,
        onPressed: onPressed,
        child: GetBuilder<HomeController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                color: controller.currentPag == index
                    ? AppColor.primarycolor
                    : AppColor.grey,
              ),
              Text(
                title,
                style: TextStyle(
                    color: controller.currentPag == index
                        ? AppColor.primarycolor
                        : AppColor.grey),
              ),
            ],
          );
        }));
  }
}
