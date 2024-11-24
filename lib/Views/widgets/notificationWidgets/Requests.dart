import 'package:flutter/material.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';
import 'package:trading_books/Views/widgets/notificationWidgets/cartMessage.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return CartMessage(
      name: "LISA",
      message: "Invitation Request",
      confirmIcon: Icons.task_alt_outlined,
      cancelIcon: Icons.cancel_outlined,
      image: AppImages.ImageName("face.jpeg"),
    );
  }
}
