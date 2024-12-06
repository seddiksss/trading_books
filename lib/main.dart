import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';

import 'package:trading_books/bindings/bindings.dart';
import 'package:trading_books/routes.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "trading books",
      options: const FirebaseOptions(
          apiKey: "apiKey",
          appId: "appId",
          messagingSenderId: "messagingSenderId",
          projectId: "projectId"));

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('================User is currently signed out!');
    } else {
      print('================User is signed in! ${user.email} ');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: InitialBindings(),
        initialRoute: FirebaseAuth.instance.currentUser != null
            ? AppRoutes.homeScreen
            : AppRoutes.onboardingScreen,
        // home: const HomeScreen(),
        getPages: getPages);
  }
}
