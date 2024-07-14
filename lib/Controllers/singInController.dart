import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingInController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? validatorFunction(String? val) {
    return "";
  }
}
