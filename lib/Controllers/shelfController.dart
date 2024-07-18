import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';

class ShelfController extends GetxController {
  ScrollController? scrollController = ScrollController();

  GlobalKey<FormState> formState = GlobalKey();
  final imagePicker = ImagePicker();
  XFile? pickedImage;
  int currentimage = 0;

  // List<String> imageList = [
  //   AppImages.ImageName("home.png"),
  //   AppImages.ImageName("home.png"),
  //   AppImages.ImageName("home.png"),
  //   AppImages.ImageName("home.png"),
  // ];

  slideImage(int val) {
    currentimage = val;
    update();
  }

  Future<void> showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Select an action',
            style: TextStyle(height: 0),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Divider(
                  color: AppColor.primarycolor,
                  height: 0,
                  thickness: 2,
                ),
                ListTile(
                  onTap: () {
                    pickImageFromGallery();
                  },
                  title: const Text("Gallery"),
                  leading: Image.asset(
                    AppImages.ImageName("gallery.png"),
                    height: 40,
                    width: 40,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    pickImage();
                  },
                  title: const Text("Camera"),
                  leading: Image.asset(
                    AppImages.ImageName("camera.jpg"),
                    height: 40,
                    width: 40,
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: AppColor.primarycolor,
              child: const Text(
                'Close',
                style: TextStyle(
                  color: AppColor.white,
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  void pickImage() async {
    final result = await imagePicker.pickImage(source: ImageSource.camera);
    if (result != null) {
      pickedImage = result;
      update();
    }
  }

  void pickImageFromGallery() async {
    final result = await imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      pickedImage = result;
      update();
    }
  }
}
