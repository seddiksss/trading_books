import 'package:get/get.dart';
import 'package:trading_books/Controllers/bookDetailsController.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Controllers/homeScreenController.dart';
import 'package:trading_books/Controllers/onboardingScreenController.dart';
import 'package:trading_books/Controllers/profilController.dart';
import 'package:trading_books/Controllers/shelfController.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingScreenController());
    Get.put(HomeController());
    Get.put(HomeScreenController());
    Get.put(ProfilController());
    Get.put(BookDetailsController());
    Get.put(ShelfController());
  }
}
