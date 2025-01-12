import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/messageController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Views/widgets/notificationWidgets/cartMessage.dart';

class Messages extends StatelessWidget {
  Messages({super.key});

  MessagController messagController = Get.find();

  @override
  Widget build(BuildContext context) {
    return _buildUserList();
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: messagController.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }
          return SizedBox(
            height: Get.height / 0.5,
            child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (conext, index) {
                  // return Text(snapshot.data![index]['email'].toString());
                  if (snapshot.data![index]['email'] !=
                      messagController.getCurrentUser()!.email) {
                    return InkWell(
                      focusColor: AppColor.black,
                      onTap: () {
                        messagController.goToChatPage(
                            snapshot.data![index]['email'],
                            snapshot.data![index]['uid']);
                      },
                      child: CartMessage(
                        name: snapshot.data![index]['email'].toString(),
                        message: 'Hello how are you',
                        image: AppImages.ImageName("face.jpeg"),
                        time: "12:30",
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          );
        });
  }
}
