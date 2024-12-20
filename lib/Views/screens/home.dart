import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Views/widgets/customCategoresButton.dart';

import 'package:trading_books/Views/widgets/homeWidgets/exploreMore.dart';
import 'package:trading_books/Views/widgets/homeWidgets/homeTitle.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final focusNode = FocusNode();
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 10,
          toolbarHeight: screenHeight / 8,
          title: TextFormField(
            focusNode: focusNode,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              suffixIcon: Icon(Icons.search),
              hintText: 'Search',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            ),
            onFieldSubmitted: (value) {},
          ),
        ),
        body: ListView(
          children: [
            Container(
                alignment: Alignment.center,
                height: screenHeight / 1.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/home.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight / 2.5,
                    ),
                    const Text(
                      " A NEW \n AND EASY \n WAY TO ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontSize: 26.0,
                          letterSpacing: 4,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 210, 205, 200)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // addUser();
                        controller.data.clear();
                        print("click button");
                        // print(".......;${controller.data[0]['title']}");

                        // addUser();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "EXCHANGE YOUR BOOKS",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: screenHeight / 35,
            ),
            const HomeTitle(title: "NEW ARRIVAL"),
            SizedBox(
              height: screenHeight / 35,
            ),
            GetBuilder<HomeController>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCategoriesButton(
                    title: "All",
                    onPressed: () {
                      controller.changeCat(0);
                    },
                    index: 0,
                  ),
                  CustomCategoriesButton(
                    title: "New",
                    onPressed: () {
                      controller.changeCat(1);
                    },
                    index: 1,
                  ),
                  CustomCategoriesButton(
                      title: "Used",
                      onPressed: () {
                        controller.changeCat(2);
                      },
                      index: 2),
                  CustomCategoriesButton(
                      title: "Exchange",
                      onPressed: () {
                        controller.changeCat(3);
                      },
                      index: 3),
                ],
              ),
            ),
            GetBuilder<HomeController>(
              builder: (controller) => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, i) =>
                      controller.itemsList[controller.currentCategories]),
            ),
            SizedBox(
              height: screenHeight / 35,
            ),
            Exploremore(onTap: () {}),
            SizedBox(
              height: screenHeight / 35,
            ),
            const HomeTitle(title: "COMMUNITY"),
            SizedBox(
              height: screenHeight / 35,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: Get.height / 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.primarycolor, width: 2)),
            ),
            SizedBox(
              height: screenHeight / 35,
            ),
            Exploremore(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
