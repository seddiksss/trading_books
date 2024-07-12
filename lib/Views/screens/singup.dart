import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/singUpController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Views/widgets/singInUpFormField.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SingUpController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sing up'),
          centerTitle: true,
        ),
        body: GetBuilder<SingUpController>(
          builder: (controller) => Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    "REGESTER TO GET STARTED!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  SingInUpFormField(
                    hinttext: 'Enter your email address',
                    iconData: const Icon(Icons.email),
                    label: "singUp",
                    obscureText: false,
                    mycontroller: controller.emailController,
                  ),
                  SingInUpFormField(
                    hinttext: 'Enter your password',
                    iconData: const Icon(Icons.lock),
                    label: "password",
                    obscureText: true,
                    mycontroller: controller.passwordController,
                  ),
                  SingInUpFormField(
                    hinttext: 'repeat your password',
                    iconData: const Icon(Icons.lock),
                    label: "password",
                    obscureText: true,
                    mycontroller: controller.repeatpasswordController,
                  ),
                  MaterialButton(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: AppColor.primarycolor,
                      child: const Text(
                        "Go to home",
                        style: TextStyle(color: AppColor.white),
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.homeScreen);
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
