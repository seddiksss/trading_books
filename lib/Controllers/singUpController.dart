import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatpasswordController = TextEditingController();

  String? validatorFunction(String? val) {
    return "";
  }
}
