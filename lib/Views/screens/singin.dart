import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/singInController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingInUpFormField(
                    hinttext: 'Enter your email address',
                    iconData: const Icon(Icons.email),
                    label: "login",
                    obscureText: false,
                    mycontroller: controller.singInController,
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
                              color: AppColor.red, fontWeight: FontWeight.w400),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(" Don't have an account "),
                      InkWell(
                          child: Text(
                        "Click here!!",
                        style: TextStyle(
                            color: AppColor.red,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.red,
                            decorationStyle: TextDecorationStyle.solid),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
