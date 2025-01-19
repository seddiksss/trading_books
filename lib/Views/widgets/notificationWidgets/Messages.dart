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

  int j = 0;
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
                    return GetBuilder<MessagController>(builder: (messagContr) {
                      return InkWell(
                        focusColor: AppColor.black,
                        onTap: () {
                          messagContr.goToChatPage(
                              snapshot.data![index]['email'],
                              snapshot.data![index]['uid']);
                          j = 0;
                        },
                        child: StreamBuilder(
                            stream: messagController.getNotifMessage(
                                messagController.getCurrentUser()!.uid,
                                snapshot.data![index]['uid']),
                            builder: (context, snap) {
                              if (snap.hasError) {
                                return const Text("Error");
                              }
                              if (snap.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text("Loading...");
                              }
                              print(
                                  "snapData ..=========${snap.data!.docs.last['receiverId']}_${snapshot.data![index]['uid']} ");

                              if (snap.data!.docs.last['receiverId'] !=
                                  snapshot.data![index]['uid']) {
                                j++;

                                print("j++ ===++==$j");
                              } else {
                                j = 0;
                                print("j =======$j");
                              }
                              print("j final ===++==$j");
                              return CartMessage(
                                name: snapshot.data![index]['email'].toString(),
                                message:
                                    snap.data!.docs.last['content'].toString(),
                                image: AppImages.ImageName("face.jpeg"),
                                time: messagController.formatTimestamp(
                                    snap.data!.docs.last['timestamp']),
                                messageCount: j,
                                notifTimeColor:
                                    snap.data!.docs.last['receiverId'] !=
                                            snapshot.data![index]['uid']
                                        ? AppColor.primarycolor
                                        : AppColor.black,
                                notifCountColor:
                                    snap.data!.docs.last['receiverId'] !=
                                            snapshot.data![index]['uid']
                                        ? AppColor.primarycolor
                                        : AppColor.white,
                              );
                            }),
                      );
                    });
                  } else {
                    return Container();
                  }
                }),
          );
        });
  }
}
