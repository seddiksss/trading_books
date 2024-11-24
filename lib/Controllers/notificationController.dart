import 'package:get/get.dart';
import 'package:trading_books/Views/widgets/notificationWidgets/Messages.dart';
import 'package:trading_books/Views/widgets/notificationWidgets/NewNotifs.dart';
import 'package:trading_books/Views/widgets/notificationWidgets/Requests.dart';
import 'package:trading_books/Views/widgets/notificationWidgets/cartMessage.dart';

class NotificationController extends GetxController {
  int currentCategories = 0;

  changeCat(int index) {
    currentCategories = index;
    update();
  }

  List requestList = [
    Messages(),
    Requests(),
    NewNotifs(),
    // CartMessage(),
  ];
}
