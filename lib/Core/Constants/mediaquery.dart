import 'package:flutter/material.dart';

class ScreenUtil {
  final BuildContext context;

  ScreenUtil({required this.context});

  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;
}
