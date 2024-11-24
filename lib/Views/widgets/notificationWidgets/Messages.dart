import 'package:flutter/material.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';
import 'package:trading_books/Views/widgets/notificationWidgets/cartMessage.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CartMessage(
        name: 'LISA AMER',
        message: 'Hello, how are you',
        image: AppImages.ImageName("face.jpeg"),
      ),
    );
  }
}
