import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreenController extends GetxController {
  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "Title of blue page",
      body:
          "Welcome to the app! This is a description on a page with a blue background.",
      image: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Image.asset(
            "assets/images/shape1.png",
          ),
        ),
      ),
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.only(top: 30),
        contentMargin: EdgeInsets.symmetric(vertical: 100),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpeg"),
                fit: BoxFit.fill)),
        // pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Title of red page",
      body:
          "Welcome to the app! This is a description on a page with a blue background.",
      image: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Image.asset(
            "assets/images/shape2.png",
          ),
        ),
      ),
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.only(top: 30),

        contentMargin: EdgeInsets.symmetric(vertical: 100),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpeg"),
                fit: BoxFit.fill)),
        // pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Title of green page",
      body:
          "Welcome to the app! This is a description on a page with a blue background.",
      image: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Image.asset(
            "assets/images/shape3.png",
          ),
        ),
      ),
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.only(top: 30),
        contentMargin: EdgeInsets.symmetric(vertical: 100),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpeg"),
                fit: BoxFit.fill)),
        // pageColor: Colors.blue,
      ),
    )
  ];
}
