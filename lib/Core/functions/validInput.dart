import 'package:get/get.dart';
import 'package:trading_books/Core/functions/myUtils.dart';

enum InputTypes {
  email,
  passwordLogin,
  userName,
  phone,
  passwordSignUp,
  repeatpasswordSingnUp,
  passwordReset,
  repasswordReset,
}

validInput(String val, int min, int max, InputTypes type) {
  if (type == InputTypes.email) {
    if (val == "") {
      return "Enter your email !!";
    }
    if (!MyUtils.isEmail(val)) {
      return "Invalid Email";
    }
    if (val.length < min) {
      return "Can't be less than 3 letters";
    }
    if (val.length > max) {
      return "Can't be large than 40 letters";
    } else {
      return null;
    }
  }
  if (type == InputTypes.repeatpasswordSingnUp) {
    return "must be the same password";
  }
  if (type == InputTypes.passwordLogin ||
      type == InputTypes.passwordSignUp ||
      type == InputTypes.passwordReset ||
      type == InputTypes.repasswordReset) {
    if (!GetUtils.hasCapitalletter(val)) {
      return "must have at least one capital letter";
    }
    if (val.length < min) {
      return "Can't be less than 4 letters";
    }
    if (val.length > max) {
      return "Can't be large than 10 letters";
    } else {
      return null;
    }
  }
  if (type == InputTypes.userName) {
    if (!MyUtils.isUsername(val)) {
      return "Invalid Username";
    }
    if (val.length < min) {
      return "Can't be less than 3 letters";
    }
    if (val.length > max) {
      return "Can't be large than 20 letters";
    } else {
      return null;
    }
  }
}
