import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trading_books/Controllers/singInController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
import 'package:trading_books/Core/Constants/AppImages.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Core/functions/myUtils.dart';
import 'package:trading_books/Core/functions/validInput.dart';
import 'package:trading_books/Views/screens/homescreen.dart';
import 'package:trading_books/Views/widgets/singInUpFormField.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyUtils());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sing in'),
          centerTitle: true,
        ),
        body: GetBuilder<SingInController>(
          builder: (controller) => Form(
            autovalidateMode: AutovalidateMode.always,
            key: controller.formstate,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
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
                    const Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, height: 2),
                    ),
                    SingInUpFormField(
                      hinttext: 'Enter your email',
                      iconData: const Icon(Icons.email),
                      obscureText: false,
                      mycontroller: controller.emailController,
                      validator: (val) {
                        return validInput(val!, 2, 40, InputTypes.email);
                      },
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, height: 2),
                    ),
                    GetBuilder<MyUtils>(
                      builder: (myUtilController) => SingInUpFormField(
                        hinttext: 'Enter your password',
                        iconData: IconButton(
                          onPressed: () {
                            myUtilController
                                .changeObscureText(InputTypes.passwordLogin);
                          },
                          icon: myUtilController.obscureTextLogin
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        obscureText: myUtilController.obscureTextLogin,
                        mycontroller: controller.passwordController,
                      ),
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
                          onTap: () async {
                            if (controller.formstate.currentState!.validate()) {
                              try {
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                        email: controller.emailController.text);
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'Change pssword',
                                  desc:
                                      'Check your email to reaset your password!.',
                                  // btnCancelOnPress: () {
                                  //   Get.back();
                                  // },
                                  btnOkOnPress: () {
                                    Get.back();
                                  },
                                ).show();
                              } catch (e) {
                                print("====error $e");
                              }

                              // Get.toNamed(AppRoutes.forgotpassword);
                            }
                          },
                        ),
                      ],
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
                          "Login",
                          style: TextStyle(color: AppColor.white),
                        ),
                        onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: controller.emailController.text,
                                    password:
                                        controller.passwordController.text);

                            if (credential.user!.emailVerified) {
                              Get.offAll(() => const HomeScreen());
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'Verify',
                                desc:
                                    'Your email is not verify! Please verify.',
                                btnCancelOnPress: () {
                                  Get.back();
                                },
                                btnOkOnPress: () {
                                  Get.back();
                                },
                              ).show();
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'invalid-credential') {
                              Get.rawSnackbar(
                                snackPosition: SnackPosition.TOP,
                                message: 'Email Or Password Incorrect.',
                                title: "Erorr",
                                backgroundColor: AppColor.red,
                                margin: const EdgeInsets.all(10),
                                borderRadius: 8,
                                duration: const Duration(seconds: 6),
                              );
                            }
                          }
                          print("===============");

                          // Get.toNamed(AppRoutes.homeScreen);
                        }),
                    const Center(
                      child: Text(
                        "--------------  Or  ---------------",
                        style: TextStyle(fontSize: 15, height: 2),
                      ),
                    ),
                    MaterialButton(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: AppColor.primarycolor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Login With Google",
                              style: TextStyle(color: AppColor.white),
                            ),
                            Image.asset(
                              AppImages.ImageName("google.png"),
                              width: 40,
                            )
                          ],
                        ),
                        onPressed: () {
                          controller.signInWithGoogle();
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
