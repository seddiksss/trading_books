import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Views/widgets/bookCardHome.dart';

class New extends StatelessWidget {
  const New({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.newData.isEmpty
          ? const Center(
              child: Text("No new book availble"),
            )
          : GridView.count(
              childAspectRatio: screenHeight / 1273,
              mainAxisSpacing: screenHeight / 20,
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                  controller.newData.length,
                  (index) => BookCardHome(
                        onTap: () {
                          controller.goToBookDetails(controller.newData, index);
                        },
                        color: Colors.blueAccent,
                        picture: controller.newData[index]['urlimages'][0],
                        title: controller.newData[index]['title'],
                        prix: controller.newData[index]['prix'],
                      )));
    });
  }
}
