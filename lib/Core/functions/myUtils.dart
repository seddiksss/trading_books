import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/inputPatterns.dart';
import 'package:trading_books/Core/Constants/statusRequests.dart';
import 'package:trading_books/Core/functions/validInput.dart';

class MyUtils extends GetxController {
  bool obscureTextLogin = true;
  bool obscureTextSignUp = true;
  bool obscureTextReset1 = true;
  bool obscureTextReset2 = true;
  static bool isUsername(String val) {
    return InputPatterns.usernamePattern.hasMatch(val);
  }

  static bool isEmail(String val) {
    return InputPatterns.emailPattern.hasMatch(val);
  }

  static bool isPhoneNumber(String val) {
    return InputPatterns.phoneNumberPattern.hasMatch(val);
  }

  static checkInternet() async {
    try {
      var result = await InternetAddress.lookup("google.com")
          .timeout(const Duration(seconds: 10));

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print("check connection true.....");
        return true;
      }
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (e) {
      print("Catch PostRequest timeOUt Error  : $e ");
      return false;
    }
  }

  static getStatusRequest(response) {
    if (response is StatusRequest) {
      return response;
    } else {
      return StatusRequest.success;
    }
  }

  changeObscureText(InputTypes type) {
    switch (type) {
      case InputTypes.passwordLogin:
        obscureTextLogin = !obscureTextLogin;
        break;
      case InputTypes.passwordSignUp:
        obscureTextSignUp = !obscureTextSignUp;
        break;
      case InputTypes.passwordReset:
        obscureTextReset1 = !obscureTextReset1;
        break;
      case InputTypes.repasswordReset:
        obscureTextReset2 = !obscureTextReset2;
        break;

      default:
    }
    update();
  }
}
