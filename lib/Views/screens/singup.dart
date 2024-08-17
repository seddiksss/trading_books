import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/singUpController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Core/functions/validInput.dart';
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
          builder: (controller) => Form(
            autovalidateMode: AutovalidateMode.always,
            key: controller.formstate,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    const Center(
                        child: Text(
                      "REGESTER TO GET STARTED!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold, height: 2),
                    ),
                    SingInUpFormField(
                      hinttext: 'Enter your email',
                      iconData: const Icon(Icons.email),
                      label: "singUp",
                      obscureText: false,
                      mycontroller: controller.emailController,
                      validator: (val) {
                        return validInput(val!, 5, 40, InputTypes.email);
                      },
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold, height: 2),
                    ),
                    SingInUpFormField(
                      hinttext: 'Enter your password',
                      iconData: const Icon(Icons.remove_red_eye),
                      label: "password",
                      obscureText: true,
                      mycontroller: controller.passwordController,
                    ),
                    const Text(
                      "Confirm password",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold, height: 2),
                    ),
                    SingInUpFormField(
                      hinttext: 'repeat your password',
                      iconData: const Icon(Icons.remove_red_eye),
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
                          "Regester",
                          style: TextStyle(color: AppColor.white),
                        ),
                        onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: controller.emailController.text,
                              password: controller.passwordController.text,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print("===========$e");
                          }
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
