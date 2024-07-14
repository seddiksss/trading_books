class InputPatterns {
  static RegExp usernamePattern = RegExp(r'^[A-Za-z]+[_-]?[A-Za-z0-9]{1,}$');
  static RegExp emailPattern =
      RegExp(r'^[A-Za-z]+[_-]?[A-Za-z0-9]*@{1}[A-Za-z0-9]{1,}.{1}[A-Za-z]+$');
  static RegExp phoneNumberPattern = RegExp(r'^(\+212|0){1}[67]{1}[0-9]{8}$');
}
