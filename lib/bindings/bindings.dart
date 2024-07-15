import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Controllers/homeScreenController.dart';
import 'package:trading_books/Controllers/onboardingScreenController.dart';
import 'package:trading_books/Controllers/profilController.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingScreenController());
    Get.put(HomeController());
    Get.put(HomeScreenController());
    Get.put(ProfilController());
  }
}
