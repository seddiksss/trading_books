import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Views/widgets/bookCardHome.dart';

class Used extends StatelessWidget {
  const Used({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return GetBuilder<HomeController>(builder: (controller) {
      return GridView.count(
          childAspectRatio: screenHeight / 1273,
          mainAxisSpacing: screenHeight / 20,
          crossAxisCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(
            controller.allitemsList.length,
            (index) => controller.allitemsList[index]['categorie'] == "Used"
                ? BookCardHome(
                    onTap: () {
                      controller.goToBookDetails(
                          controller.allitemsList, index);
                    },
                    color: Colors.blueAccent,
                    picture: controller.allitemsList[index]['pictures'][0],
                    title: controller.allitemsList[index]['title'],
                    prix: controller.allitemsList[index]['prix'],
                  )
                : Center(child: Text("no Used items")),
          ));
    });
  }
}
