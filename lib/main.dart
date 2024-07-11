import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Views/screens/home.dart';
import 'package:trading_books/Views/screens/homescreen.dart';
import 'package:trading_books/Views/screens/notifications.dart';
import 'package:trading_books/Views/screens/onboarding1.dart';
import 'package:trading_books/Views/screens/onboardingscreen.dart';
import 'package:trading_books/Views/screens/profil.dart';
import 'package:trading_books/Views/screens/singin.dart';
import 'package:trading_books/Views/screens/singup.dart';
import 'package:trading_books/bindings/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.onboardingScreen,
      getPages: [
        GetPage(
            name: AppRoutes.onboardingScreen,
            page: () => const OnboardingScreen()),
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
