import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/bookDetailsController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: GetBuilder<BookDetailsController>(builder: (controller) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight / 1.6,
                    child: PageView.builder(
                        onPageChanged: (val) {
                          controller.slideImage(val);
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: controller
                            .itemsList[controller.index]['urlimages'].length,
                        itemBuilder: (context, i) {
                          return Container(
                              width: screenHeight / 2.25,
                              decoration: BoxDecoration(
                                color: AppColor.grey.withOpacity(0.1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.1), // Shadow color
                                    offset: const Offset(4, 5), // Shadow offset
                                    blurRadius: 8, // Shadow blur radius
                                  ),
                                ],
                              ),
                              child: Image.network(
                                controller.itemsList[controller.index]
                                    ['urlimages'][i],
                                fit: BoxFit.fill,
                              )
                              // Image(
                              //   image: controller.itemsList[controller.index]
                              //       ['urlimages'][i],
                              //   fit: BoxFit.fill,
                              // ),
                              );
                        }),
                  ),
                  GetBuilder<BookDetailsController>(
                      builder: (controller) => SizedBox(
                            height: Get.height / 25,
                            width: Get.width / 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ...List.generate(
                                  controller
                                      .itemsList[controller.index]['urlimages']
                                      .length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      color: AppColor.primarycolor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width:
                                              controller.currentimage == index
                                                  ? 6
                                                  : 3,
                                          color:
                                              controller.currentimage == index
                                                  ? AppColor.primarycolor
                                                  : AppColor.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Text(
                controller.itemsList[controller.index]['title'],
                style: TextStyle(fontSize: Get.width / 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Text(
                controller.itemsList[controller.index]['author'],
                style: TextStyle(fontSize: Get.width / 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Text(
                controller.itemsList[controller.index]['prix'],
                style: TextStyle(fontSize: Get.width / 25),
              ),
            ),
            MaterialButton(
                height: Get.height / 20,
                color: AppColor.primarycolor,
                child: Row(children: [
                  const Icon(
                    Icons.add,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    width: Get.width / 20,
                  ),
                  const Text(
                    "Add To Cart",
                    style: TextStyle(color: AppColor.white, fontSize: 17),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.favorite_border,
                    color: AppColor.white,
                  )
                ]),
                onPressed: () {}),
          ],
        );
      }),
    );
  }
}
