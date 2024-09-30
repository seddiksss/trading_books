import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/singUpController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Core/functions/myUtils.dart';
import 'package:trading_books/Core/functions/validInput.dart';
import 'package:trading_books/Views/widgets/singInUpFormField.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
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
                    GetBuilder<MyUtils>(
                      builder: (myUtilController) => SingInUpFormField(
                        hinttext: 'Enter your password',
                        iconData: IconButton(
                          onPressed: () {
                            myUtilController
                                .changeObscureText(InputTypes.passwordSignUp);
                          },
                          icon: myUtilController.obscureTextSignUp
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        obscureText: myUtilController.obscureTextSignUp,
                        mycontroller: controller.passwordController,
                        validator: (val) {
                          return validInput(
                              val!, 4, 20, InputTypes.passwordSignUp);
                        },
                      ),
                    ),
                    const Text(
                      "Confirm password",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold, height: 2),
                    ),
                    GetBuilder<MyUtils>(
                      builder: (myUtilController) => SingInUpFormField(
                        hinttext: 'Repeat your password',
                        iconData: IconButton(
                          onPressed: () {
                            myUtilController.changeObscureText(
                                InputTypes.repeatpasswordSingnUp);
                          },
                          icon: myUtilController.obscureTextRepeatSignUp
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        obscureText: myUtilController.obscureTextRepeatSignUp,
                        mycontroller: controller.repeatpasswordController,
                        validator: (val) {
                          if (val != controller.passwordController.text) {
                            return validInput(
                                val!, 4, 20, InputTypes.repeatpasswordSingnUp);
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: AppColor.primarycolor,
                        child: const Text(
                          "Regester",
                          style: TextStyle(color: AppColor.white),
                        ),
                        onPressed: () async {
                          if (controller.formstate.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: controller.emailController.text,
                                password: controller.passwordController.text,
                              );
                              await FirebaseAuth.instance.currentUser!
                                  .sendEmailVerification();
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'Verify',
                                desc: 'Please verify your email!.',
                                btnOkOnPress: () {
                                  Get.back();
                                },
                              ).show();
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                Get.rawSnackbar(
                                  snackPosition: SnackPosition.TOP,
                                  message: 'The password provided is too weak.',
                                  title: "Erorr",
                                  backgroundColor: AppColor.red,
                                  margin: const EdgeInsets.all(10),
                                  borderRadius: 8,
                                  duration: const Duration(seconds: 6),
                                );

                                // print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                // print(
                                //     'The account already exists for that email.');
                                Get.rawSnackbar(
                                  snackPosition: SnackPosition.TOP,
                                  message:
                                      'The account already exists for that email.',
                                  title: "Erorr",
                                  backgroundColor: AppColor.red,
                                  margin: const EdgeInsets.all(10),
                                  borderRadius: 8,
                                  duration: const Duration(seconds: 6),
                                );
                              }
                            } catch (e) {
                              print("===========$e");
                            }
                          }

                          // print("=======this rout is temprery===");
                          // Get.back();

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
