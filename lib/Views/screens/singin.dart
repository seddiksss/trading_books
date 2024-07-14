import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/singInController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Core/functions/validInput.dart';
import 'package:trading_books/Views/screens/homescreen.dart';
import 'package:trading_books/Views/widgets/singInUpFormField.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SingInController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sing in'),
          centerTitle: true,
        ),
        body: GetBuilder<SingInController>(
          builder: (controller) => Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: controller.formstate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                        child: Text(
                      "SING IN TO GET STARTED!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                    const SizedBox(
                      height: 50,
                    ),
                    SingInUpFormField(
                      hinttext: 'Enter your email address',
                      iconData: const Icon(Icons.email),
                      label: "login",
                      obscureText: false,
                      mycontroller: controller.emailController,
                      validator: (val) {
                        return validInput(val!, 5, 40, InputTypes.email);
                      },
                    ),
                    SingInUpFormField(
                      hinttext: 'Enter your password',
                      iconData: const Icon(Icons.lock),
                      label: "password",
                      obscureText: true,
                      mycontroller: controller.passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: const Text(
                            "Forget password?",
                            style: TextStyle(
                                color: AppColor.red,
                                fontWeight: FontWeight.w400),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(" Don't have an account "),
                        InkWell(
                          child: const Text(
                            "Click here!!",
                            style: TextStyle(
                                color: AppColor.red,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.red,
                                decorationStyle: TextDecorationStyle.solid),
                          ),
                          onTap: () {
                            Get.toNamed(AppRoutes.singup);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
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
                          Get.offAll(const HomeScreen());
                          // Get.toNamed(AppRoutes.homeScreen);
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
