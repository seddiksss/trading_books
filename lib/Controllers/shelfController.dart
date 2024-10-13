import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';

class ShelfController extends GetxController {
  bool isLoading = false;
  ScrollController? scrollController = ScrollController();
  GlobalKey<FormState>? formState = GlobalKey();
  final imagePicker = ImagePicker();
  XFile? pickedImage;
  int currentimage = 0;
  List<ImageProvider> pickedImagepath = [];
  int j = 4;
  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController prix = TextEditingController();

  String dropVal = "New";
  List<DropdownMenuItem<String?>>? items = ['New', 'Used', 'Exchange']
      .map<DropdownMenuItem<String?>>((String val) => DropdownMenuItem(
            value: val,
            child: Text(val),
          ))
      .toList();
  void dropChange(String? val) {
    dropVal = val!;
    print("===$dropVal");
    update();
  }

  @override
  void onInit() {
    super.onInit();
    print("....onInit()");
    update();
  }

  @override
  void dispose() {
    print("dispose............");
    super.dispose();
  }

  void clearShelf() {
    title.clear();
    author.clear();
    prix.clear();
    pickedImage = null;
    pickedImagepath.clear();
  }
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

////////////////////////////////////////////////////
  Future<void> showMyDialog(context) async {
    return showDialog<void>(
      //  barrierDismissible: true,
      context: context,
      barrierDismissible: true, // user must tap button!
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
                    if (pickedImagepath.length < 4) {
                      pickImageFromGallery();
                    }
                    j--;
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
                    if (pickedImagepath.length < 4) {
                      pickImage();
                    }
                    j--;
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
            GetBuilder<ShelfController>(
              builder: (controller) => pickedImagepath.length == 4
                  ? MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: AppColor.primarycolor,
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: AppColor.white,
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    )
                  : Center(
                      child: SizedBox(
                        child: Text(
                          "Add $j images...",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
            )
          ],
        );
      },
    );
  }

  void pickImage() async {
    final result = await imagePicker.pickImage(source: ImageSource.camera);

    if (result != null) {
      pickedImage = result;
      await putDownImage();
      // pickedImagepath.add(pickedImage!.path);
      pickedImagepath.add(FileImage(File(result.path)));
      print("picked image ${pickedImage!.path}");
      update();
    }
  }

  String? getedimage;
  String? imagename;
  List imageList = [];
  void pickImageFromGallery() async {
    // isLoading = true;
    final result = await imagePicker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      pickedImage = result;
      await putDownImage();
      // pickedImagepath.add(pickedImage!.path);
      pickedImagepath.add(FileImage(File(result.path)));
      print("picked image ${pickedImage!.path}");
      update();
    }
  }

  putDownImage() async {
    imagename = basename(pickedImage!.path);
    var refStorage = FirebaseStorage.instance.ref("images/$dropVal/$imagename");
    await refStorage.putFile(File(pickedImage!.path));
    getedimage = await refStorage.getDownloadURL();
    // isLoading = false;
    imageList.add(getedimage);
  }

  CollectionReference users =
      FirebaseFirestore.instance.collection("categories");
  Future<void> addCategory() async {
    isLoading = true;
    update();
    // Call the user's CollectionReference to add a new user
    // await users
    //     .doc("$dropVal")
    //     .set({
    //       'urlimages': imageList, // John Doe
    //       'title': title.text, // John Doe
    //       'author': author.text, // Stokes and Sons
    //       'prix': prix.text,
    //       'categorie': dropVal,
    //       'id': FirebaseAuth.instance.currentUser!.uid,
    //     })
    //     .then((value) => print("User Added"))
    //     .catchError((error) => print("Failed to add user: $error"));
    await users
        .add({
          'urlimages': imageList, // John Doe
          'title': title.text, // John Doe
          'author': author.text, // Stokes and Sons
          'prix': prix.text,
          'categorie': dropVal,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    isLoading = false;
  }
}
