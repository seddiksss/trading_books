import 'package:flutter/material.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';

class CartMessage extends StatelessWidget {
  final String? image;
  final String name;
  final String message;
  final IconData? cancelIcon;
  final IconData? confirmIcon;

  const CartMessage(
      {super.key,
      this.image,
      required this.name,
      required this.message,
      this.cancelIcon,
      this.confirmIcon});
  void showImagePopup(String? imagePath, context) {
    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: true,
    //   backgroundColor: Colors.transparent,
    //   builder: (context) => Container(
    //     // padding: MediaQuery.of(context).viewInsets,
    //     height: MediaQuery.of(context).size.height,
    //     child: Image.asset(
    //       imagePath,
    //       // width: 80.w,
    //     ),
    //     // child: Hero(
    //     //     tag: "${controller.itemsModel.itemId}",
    //     //     child: Center(
    //     //       child: CachedNetworkImage(
    //     //         imageUrl:
    //     //             "${AppLink.itemsImages}/${controller.itemsModel.itemImage}",
    //     //         height: 250,
    //     //         fit: BoxFit.fill,
    //     //       ),
    //     //     ),
    //     //   ),
    //   ),
    // );

    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.topCenter,
          title: Text(name),
          content: SizedBox(
            height: 200,
            child: Image.asset(
              image!,
              fit: BoxFit.fitHeight,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                showImagePopup(AppImages.ImageName(image!), context);
              },
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(
                  image!,
                ),
              )),
          const SizedBox(
            width: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    fontFamily: "sans"),
              ),
              Text(
                message,
                style: const TextStyle(fontSize: 20, fontFamily: "sans"),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        confirmIcon,
                        color: AppColor.primarycolor,
                        size: 45,
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        cancelIcon,
                        size: 45,
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
