import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/bookDetailsController.dart';
import 'package:trading_books/Controllers/shelfController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';

class Shelf extends GetView<ShelfController> {
  const Shelf({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final focusNode = FocusNode();
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Your Book'),
          centerTitle: true,
        ),
        body: ListView(
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
                        itemCount: 4,
                        itemBuilder: (context, i) {
                          return Container(
                            width: screenHeight / 2.25,
                            decoration: BoxDecoration(
                              color: AppColor.grey.withOpacity(0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.1), // Shadow color
                                  offset: const Offset(4, 5), // Shadow offset
                                  blurRadius: 8, // Shadow blur radius
                                ),
                              ],
                            ),
                            child: Center(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 70),
                                child: MaterialButton(
                                    // padding: const EdgeInsets.symmetric(
                                    //     horizontal: 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    height: Get.height / 20,
                                    color: AppColor.primarycolor,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: AppColor.white,
                                          ),
                                          SizedBox(
                                            width: Get.width / 40,
                                          ),
                                          const Text(
                                            "Add Photos",
                                            style: TextStyle(
                                                color: AppColor.white,
                                                fontSize: 17),
                                          ),
                                        ]),
                                    onPressed: () {
                                      controller.showMyDialog(context);
                                    }),
                              ),
                            ),
                          );
                        }),
                  ),
                  GetBuilder<ShelfController>(
                      builder: (controller) => SizedBox(
                            height: Get.height / 25,
                            width: Get.width / 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ...List.generate(
                                  4,
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
                "TITLE",
                style: TextStyle(fontSize: Get.width / 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: TextFormField(
                focusNode: focusNode,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  filled: true,
                  hintText: 'Add title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                ),
                onFieldSubmitted: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Text(
                "AUTHOR",
                style: TextStyle(fontSize: Get.width / 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: TextFormField(
                focusNode: focusNode,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  filled: true,
                  hintText: 'Add author',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                ),
                onFieldSubmitted: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Text(
                "PRIX",
                style: TextStyle(fontSize: Get.width / 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: TextFormField(
                focusNode: focusNode,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  filled: true,
                  hintText: 'Add prix ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                ),
                onFieldSubmitted: (value) {},
              ),
            ),
            MaterialButton(
                height: Get.height / 20,
                color: AppColor.primarycolor,
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: AppColor.white, fontSize: 17),
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
