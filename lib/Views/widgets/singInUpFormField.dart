import 'package:flutter/material.dart';

class SingInUpFormField extends StatelessWidget {
  final String hinttext;
  final String label;
  final Widget iconData;
  final TextEditingController mycontroller;
  final bool? obscureText;
  final FocusNode? focusNode;

  final String? Function(String?)? validator;

  const SingInUpFormField({
    super.key,
    required this.hinttext,
    required this.label,
    required this.iconData,
    required this.mycontroller,
    this.validator,
    this.obscureText,
    this.focusNode,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        focusNode: focusNode,
        controller: mycontroller,
        obscureText: obscureText == null ? false : obscureText!,
        validator: validator,
        decoration: InputDecoration(
            filled: true,
            // fillColor: Colors.grey,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            label: Text(label),
            suffixIcon: iconData,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            )),
      ),
    );
  }
}
