import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';

class BookDetailsController extends GetxController {
  ScrollController? scrollController = ScrollController();

  GlobalKey<FormState> formState = GlobalKey();
  int currentimage = 0;
  List<String> imageList = [
    AppImages.ImageName("home.png"),
    AppImages.ImageName("home.png"),
    AppImages.ImageName("home.png"),
    AppImages.ImageName("home.png"),
  ];

  slideImage(int val) {
    currentimage = val;
    update();
  }
}
