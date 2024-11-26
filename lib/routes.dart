import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Middelwares/middelware.dart';
import 'package:trading_books/Views/screens/bookDetails.dart';

import 'package:trading_books/Views/screens/home.dart';
import 'package:trading_books/Views/screens/homescreen.dart';
import 'package:trading_books/Views/screens/notifications.dart';
import 'package:trading_books/Views/screens/onboardingscreen.dart';
import 'package:trading_books/Views/screens/payment.dart';
import 'package:trading_books/Views/screens/profil.dart';
import 'package:trading_books/Views/screens/singin.dart';
import 'package:trading_books/Views/screens/singup.dart';
import 'package:trading_books/Views/widgets/notificationWidgets/chatScreen.dart';
import 'package:trading_books/bindings/bindings.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: AppRoutes.chatScreen,
    page: () => ChatScreen(
      currentUserId: FirebaseAuth.instance.currentUser!.uid,
      otherUserId: '',
    ),
    // middlewares: [AppMiddleWare()]
  ),
  GetPage(
    name: AppRoutes.payment,
    page: () => const Payment(),
    // middlewares: [AppMiddleWare()]
  ),
  GetPage(
      name: AppRoutes.bookDetails,
      page: () => const BookDetails(),
      binding: BookDetailsBindings()
      // middlewares: [AppMiddleWare()]
      ),
  GetPage(
      name: AppRoutes.onboardingScreen,
      page: () => const OnboardingScreen(),
      middlewares: [AppMiddleWare()]),
  GetPage(
    name: AppRoutes.singin,
    page: () => const SingIn(),
    // middlewares: [AppMiddleWare()]
  ),
  GetPage(
      name: AppRoutes.singup,
      page: () => const SingUp(),
      binding: SignUpBindings()
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
      binding: ProfileBindings()
      // middlewares: [AppMiddleWare()]
      ),
];
