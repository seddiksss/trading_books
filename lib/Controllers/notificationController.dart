import 'package:get/get.dart';
import 'package:trading_books/Views/widgets/notificationWidgets/request.dart';

class NotificationController extends GetxController {
  int currentCategories = 0;

  changeCat(int index) {
    currentCategories = index;
    update();
  }

  List requestList = [
    Request(),
    Request(),
    Request(),
  ];
}
