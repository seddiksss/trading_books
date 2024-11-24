import 'package:flutter/material.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60)),
              child: Image.asset(AppImages.ImageName("camera.jpg")),
            ),
            Column(
              children: [Text("LISA AMER"), Text("ssssssss")],
            )
          ],
        )
      ],
    );
  }
}
