import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Views/screens/community.dart';
import 'package:trading_books/Views/screens/home.dart';
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
    const Profile()
  ];
  List<Widget> itemsList = [
    const All(),
    const New(),
    const Used(),
    const Exchange(),
  ];
  changePage(int index) {
    currentPag = index;
    update();
  }

  changeCat(int index) {
    currentCategories = index;
    update();
  }

  goToBookDetails() {
    Get.toNamed(AppRoutes.bookDetails);
  }
}
