import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Views/widgets/bookCardHome.dart';

class Exchange extends StatelessWidget {
  const Exchange({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.exchData.isEmpty
          ? const Center(
              child: Text("No exchange book availble"),
            )
          : GridView.count(
              childAspectRatio: screenHeight / 1273,
              mainAxisSpacing: screenHeight / 20,
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                  controller.exchData.length,
                  (index) => BookCardHome(
                        onTap: () {
                          controller.goToBookDetails(
                              controller.exchData, index);
                        },
                        color: Colors.blueAccent,
                        picture: controller.exchData[index]['urlimages'][0],
                        title: controller.exchData[index]['title'],
                        prix: controller.exchData[index]['prix'],
                      )));
    });
  }
}
