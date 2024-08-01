import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Views/screens/community.dart';
import 'package:trading_books/Views/screens/home.dart';
import 'package:trading_books/Views/screens/payment.dart';
import 'package:trading_books/Views/screens/profil.dart';
import 'package:trading_books/Views/screens/notifications.dart';
import 'package:trading_books/Views/screens/shelf.dart';
import 'package:trading_books/Views/widgets/homeWidgets/all.dart';
import 'package:trading_books/Views/widgets/homeWidgets/exchange.dart';
import 'package:trading_books/Views/widgets/homeWidgets/new.dart';
import 'package:trading_books/Views/widgets/homeWidgets/used.dart';

class HomeController extends GetxController {
  int currentPag = 0;
  int currentCategories = 0;
  List<Widget> pageList = [
    const Home(),
    const Community(),
    const Shelf(),
    const Notifications(),
    const Profile(),
    const Payment(),
  ];
  List<Widget> itemsList = [
    const All(),
    const New(),
    const Used(),
    const Exchange(),
  ];
  List<ImageProvider> imagesList = [];
  // List<ImageProvider> newimagesList = [];
  // List<ImageProvider> newimagesListFix = [];
  // List<ImageProvider> usedimagesList = [];
  // List<ImageProvider> exchangeimagesList = [];

  List allitemsList = [];
  List newitemsList = [];

  List useditemsList = [];
  List exchangeitemsList = [];
  // Map newitemsMap = ;

  changePage(int index) {
    currentPag = index;
    update();
  }

  changeCat(int index) {
    currentCategories = index;

    update();
  }

  goToBookDetails(List list, int index) {
    Get.toNamed(AppRoutes.bookDetails, arguments: {
      'index': index,
      'itemsList': list,
    });
    update();
  }

  // goToBookNewDetails(List list, int index) {
  //   // print('allitemsList:${allitemsList[index]}');

  //   allitemsList[index]['categorie'] = "New";

  //   Get.toNamed(AppRoutes.bookDetails, arguments: {
  //     'all': allitemsList[index],
  //     'new': newitemsList.isEmpty ? null : newitemsList[index],
  //     // 'images': imagesList,
  //     'newimages': newimagesList,
  //   });
  //   update();
  // }

  // goToBookUsedDetails(int index) {
  //   print('allitemsList:${allitemsList}');
  //   allitemsList[index]['categorie'] = "Used";
  //   Get.toNamed(AppRoutes.bookDetails, arguments: {
  //     'all': allitemsList[index],
  //     'used': useditemsList.isEmpty ? null : useditemsList[index],
  //     // 'images': imagesList,
  //     'usedimages': usedimagesList,
  //   });
  //   update();
  // }

  // goToBookExchangeDetails(int index) {
  //   allitemsList[index]['categorie'] = "Exchange";

  //   Get.toNamed(AppRoutes.bookDetails, arguments: {
  //     'all': allitemsList[index],
  //     'exchange': exchangeitemsList.isEmpty ? null : exchangeitemsList[index],
  //     // 'images': imagesList,
  //     'exchangeimages': exchangeimagesList,
  //   });
  //   update();
  // }
}
