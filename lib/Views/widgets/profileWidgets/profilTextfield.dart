import 'package:flutter/material.dart';

class Profiltextfield extends StatelessWidget {
  const Profiltextfield({
    super.key,
    required this.hint,
  });
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }
}
