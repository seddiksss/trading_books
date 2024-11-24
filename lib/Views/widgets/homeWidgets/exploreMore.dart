import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';

class Exploremore extends StatelessWidget {
  final Function() onTap;

  const Exploremore({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Get.width / 3.5),
        height: Get.height / 15,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.primarycolor, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Explore More",
              style: TextStyle(
                  color: AppColor.primarycolor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.read_more_sharp,
              color: AppColor.primarycolor,
            )
          ],
        ),
      ),
    );
  }
}
