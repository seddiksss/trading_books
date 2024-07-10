import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Views/screens/home.dart';
import 'package:trading_books/Views/screens/homescreen.dart';
import 'package:trading_books/Views/screens/notifications.dart';
import 'package:trading_books/Views/screens/onboarding1.dart';
import 'package:trading_books/Views/screens/profil.dart';
import 'package:trading_books/Views/screens/singin.dart';
import 'package:trading_books/Views/screens/singup.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: AppRoutes.onboarding,
    page: () => const Onboarding1(),
    // middlewares: [AppMiddleWare()]
  ),
  GetPage(
    name: AppRoutes.singin,
    page: () => const SingIn(),
    // middlewares: [AppMiddleWare()]
  ),
  GetPage(
    name: AppRoutes.singup,
    page: () => const SingUp(),
    // middlewares: [AppMiddleWare()]
  ),

  GetPage(
    name: AppRoutes.homeScreen,
    page: () => const HomeScreen(),
    // middlewares: [AppMiddleWare()]
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => const Home(),
    // middlewares: [AppMiddleWare()]
  ),
  // GetPage(
  //   name: "/",
  //   page: () => const ItemDetails(),
  // ),
  GetPage(
    name: AppRoutes.notifications,
    page: () => const Notifications(),
    // middlewares: [AppMiddleWare()]
  ),
  GetPage(
    name: AppRoutes.profile,
    page: () => const Profile(),
    // middlewares: [AppMiddleWare()]
  ),
];
