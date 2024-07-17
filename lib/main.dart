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
import 'package:trading_books/routes.dart';

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
        initialRoute: AppRoutes.onboardingScreen,
        // home: const BookDetails(),
        getPages: getPages);
  }
}
