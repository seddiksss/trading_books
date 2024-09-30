import 'package:get/get.dart';
import 'package:trading_books/Controllers/bookDetailsController.dart';

import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Controllers/homeScreenController.dart';
import 'package:trading_books/Controllers/onboardingScreenController.dart';
import 'package:trading_books/Controllers/profilController.dart';
import 'package:trading_books/Controllers/shelfController.dart';
import 'package:trading_books/Controllers/singInController.dart';
import 'package:trading_books/Controllers/singUpController.dart';
import 'package:trading_books/Core/functions/myUtils.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingScreenController());
    Get.put(HomeController());
    Get.put(HomeScreenController());
    // Get.put(BookDetailsController());
    Get.put(ProfilController());
    Get.put(SingInController());
    // Get.put(SingUpController());

    // Get.put(ShelfController());
  }
}

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SingUpController());
  }
}

class ShelfBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ShelfController());
  }
}

class ProfileBindings extends Bindings {
  @override
  void dependencies() {}
}

class BookDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BookDetailsController());
  }
}
