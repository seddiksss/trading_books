import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Views/widgets/bookCardHome.dart';

class All extends StatelessWidget {
  const All({super.key});

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
            (index) => Stack(
              children: [
                BookCardHome(
                  onTap: () {
                    controller.goToBookDetails(controller.allitemsList, index);
                  },
                  color: Colors.blueAccent,
                  picture: controller.allitemsList[index]['pictures'][0],
                  title: controller.allitemsList[index]['title'],
                  prix: controller.allitemsList[index]['prix'],
                ),
                Positioned(
                    top: 10,
                    right: 30,
                    child: Text(
                      controller.allitemsList[index]['categorie'],
                      style:
                          const TextStyle(fontSize: 14, color: AppColor.white),
                    ))
              ],
            ),
          ));
    });
  }
}
