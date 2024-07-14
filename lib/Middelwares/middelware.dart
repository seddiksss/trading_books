// ignore: implementation_imports

// ignore: implementation_imports
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';

final box = GetStorage();

class AppMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (box.read('step') == 2) {
      return RouteSettings(name: AppRoutes.home);
    }
    if (box.read('onBoarding finish') != null) {
      return RouteSettings(name: AppRoutes.singin);
    }
    return null;
  }
}
