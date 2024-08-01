import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Controllers/shelfController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';

class Shelf extends GetView<ShelfController> {
  const Shelf({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShelfController());
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final focusNode1 = FocusNode();
    final focusNode2 = FocusNode();
    final focusNode3 = FocusNode();

    return GestureDetector(
      onTap: () {
        focusNode1.unfocus();
        focusNode2.unfocus();
        focusNode3.unfocus();
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
                      child: GetBuilder<ShelfController>(
                        builder: (controller) => PageView.builder(
                            physics: controller.pickedImagepath.isEmpty
                                ? const NeverScrollableScrollPhysics()
                                : null,
                            onPageChanged: (val) {
                              controller.slideImage(val);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.pickedImagepath.isNotEmpty
                                ? controller.pickedImagepath.length
                                : 4,
                            itemBuilder: (context, i) {
                              // controller.currentimage = i;

                              return Container(
                                  width: screenHeight / 2.25,
                                  decoration: BoxDecoration(
                                    color: AppColor.grey.withOpacity(0.2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.1), // Shadow color
                                        offset:
                                            const Offset(4, 5), // Shadow offset
                                        blurRadius: 8, // Shadow blur radius
                                      ),
                                    ],
                                  ),
                                  child: controller.pickedImage != null
                                      ? (Image(
                                          image: controller.pickedImagepath[i],
                                          fit: BoxFit.fill,
                                        ))
                                      : Center(
                                          child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 70),
                                              child: MaterialButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  height: Get.height / 20,
                                                  color: AppColor.primarycolor,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons.add,
                                                          color: AppColor.white,
                                                        ),
                                                        SizedBox(
                                                          width: Get.width / 40,
                                                        ),
                                                        const Text(
                                                          "Add -4- Photos",
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .white,
                                                              fontSize: 17),
                                                        ),
                                                      ]),
                                                  onPressed: () {
                                                    controller
                                                        .showMyDialog(context);
                                                  })),
                                        ));
                            }),
                      )),
                  GetBuilder<ShelfController>(
                      builder: (controller) => SizedBox(
                            height: Get.height / 25,
                            width: Get.width / 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ...List.generate(
                                  controller.pickedImagepath.isNotEmpty
                                      ? controller.pickedImagepath.length
                                      : 4,
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
                controller: controller.title,
                focusNode: focusNode1,
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
                controller: controller.author,
                focusNode: focusNode2,
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
                controller: controller.prix,
                focusNode: focusNode3,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Text(
                "CATEGORIE",
                style: TextStyle(fontSize: Get.width / 20),
              ),
            ),
            GetBuilder<ShelfController>(
              builder: (controller) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                child: DropdownButton(
                    elevation: 16,
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: Colors.grey[200],
                    iconSize: 30,
                    isExpanded: true,
                    items: controller.items,
                    value: controller.dropVal,
                    onChanged: (val) {
                      controller.dropChange(val);
                    }),
              ),
            ),
            GetBuilder<HomeController>(builder: (homecont) {
              return MaterialButton(
                  height: Get.height / 20,
                  color: AppColor.primarycolor,
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: AppColor.white, fontSize: 17),
                  ),
                  onPressed: () {
                    print("drop val : ${controller.dropVal}");
                    // homecont.newimagesList.clear();
                    // homecont.usedimagesList.clear();
                    // homecont.exchangeimagesList.clear();
                    // homecont.imagesList.clear();
                    // homecont.allitemsList.clear();

                    controller.j = 4;
                    homecont.imagesList.addAll(controller.pickedImagepath);
                    homecont.allitemsList.add({
                      'pictures': homecont.imagesList,
                      'title': controller.title.text,
                      'author': controller.author.text,
                      'prix': controller.prix.text,
                      'categorie': controller.dropVal
                    });
                    print("allitemsList::${homecont.allitemsList}");

                    if (controller.dropVal == "New") {
                      homecont.newitemsList.addAll(homecont.allitemsList);
                    } else if (controller.dropVal == "Used") {
                      homecont.useditemsList.addAll(homecont.allitemsList);
                    } else {
                      homecont.exchangeitemsList.addAll(homecont.allitemsList);
                    }
                    Get.snackbar("Success", "item has been listed",
                        backgroundColor: AppColor.primarycolor,
                        colorText: AppColor.white);

                    homecont.changePage(0);
                    controller.clearShelf();
                  });
            }),
          ],
        ),
      ),
    );
  }
}
