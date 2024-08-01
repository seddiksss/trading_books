import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';

class BookDetailsController extends GetxController {
  ScrollController? scrollController = ScrollController();

  GlobalKey<FormState> formState = GlobalKey();
  int currentimage = 0;

  int index = 0;
  List itemsList = [];

  List imagesList = [];
  List<ImageProvider<Object>> newimagesList = [];
  List<ImageProvider<Object>> usedimagesList = [];
  List<ImageProvider<Object>> exchangeimagesList = [];
  // List<ImageProvider<Object>> imagesList = [];

  Map itemsMap = {};
  List<String> imageList = [
    AppImages.ImageName("home.png"),
    AppImages.ImageName("shape1.png"),
    AppImages.ImageName("book1.png"),
    AppImages.ImageName("book2.png"),
  ];

  slideImage(int val) {
    currentimage = val;
    update();
  }

  @override
  void onInit() {
    index = Get.arguments['index'];
    itemsList = Get.arguments['itemsList'];

    // print(" Categorie ..${Get.arguments['all']['categorie']}");
    // if (Get.arguments['all']['categorie'] == "New") {
    //   itemsMap = Get.arguments['new'];
    // } else if (Get.arguments['all']['categorie'] == "Used") {
    //   itemsMap = Get.arguments['used'];
    // } else if (Get.arguments['all']['categorie'] == "Exchange") {
    //   itemsMap = Get.arguments['exchange'];
    // } else {
    //   itemsMap = Get.arguments['all'];
    // }

    // if (Get.arguments['all']['categorie'] == "New") {
    //   imagesList = Get.arguments['newimages'];
    // } else if (Get.arguments['all']['categorie'] == "Used") {
    //   imagesList = Get.arguments['usedimages'];
    // } else if (Get.arguments['all']['categorie'] == "Exchange") {
    //   imagesList = Get.arguments['exchangeimages'];
    // } else {
    //   imagesList = Get.arguments['images'];
    // }
    // print("....onInit()");
    // print(".items...$itemsMap");
    // print(".images...$imagesList");

    super.onInit();

    update();
  }
}
