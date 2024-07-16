import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Middelwares/middelware.dart';
import 'package:trading_books/Views/screens/bookDetails.dart';
import 'package:trading_books/Views/screens/home.dart';
import 'package:trading_books/Views/screens/homescreen.dart';
import 'package:trading_books/Views/screens/notifications.dart';
import 'package:trading_books/Views/screens/onboardingscreen.dart';
import 'package:trading_books/Views/screens/profil.dart';
import 'package:trading_books/Views/screens/singin.dart';
import 'package:trading_books/Views/screens/singup.dart';
import 'package:trading_books/bindings/bindings.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      // initialRoute: AppRoutes.onboardingScreen,
      home: BookDetails(),
      getPages: [
        GetPage(
            name: AppRoutes.onboardingScreen,
            page: () => const OnboardingScreen(),
            middlewares: [AppMiddleWare()]),
        GetPage(name: AppRoutes.singin, page: () => const SingIn()),
        GetPage(name: AppRoutes.singup, page: () => const SingUp()),
        GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
        GetPage(name: AppRoutes.home, page: () => const Home()),
        GetPage(
            name: AppRoutes.notifications, page: () => const Notifications()),
        GetPage(name: AppRoutes.profile, page: () => const Profile()),
      ],
    );
  }
}
