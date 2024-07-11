import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Views/screens/home.dart';
import 'package:trading_books/Views/screens/profil.dart';
import 'package:trading_books/Views/screens/notifications.dart';

class HomeController extends GetxController {
  int currentPag = 0;
  List<Widget> pageList = [
    const Home(),
    const Notifications(),
    const Profile()
  ];
  changePage(int index) {
    currentPag = index;
    update();
  }
}
