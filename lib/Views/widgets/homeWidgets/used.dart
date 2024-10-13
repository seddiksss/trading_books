import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Views/widgets/bookCardHome.dart';

class Used extends StatelessWidget {
  const Used({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.usedData.isEmpty
          ? const Center(
              child: Text("No used book availble"),
            )
          : GridView.count(
              childAspectRatio: screenHeight / 1273,
              mainAxisSpacing: screenHeight / 20,
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                  controller.usedData.length,
                  (index) => BookCardHome(
                        onTap: () {
                          controller.goToBookDetails(
                              controller.usedData, index);
                        },
                        color: Colors.blueAccent,
                        picture: controller.usedData[index]['urlimages'][0],
                        title: controller.usedData[index]['title'],
                        prix: controller.usedData[index]['prix'],
                      )));
    });
  }
}
