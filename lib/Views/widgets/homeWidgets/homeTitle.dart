import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  const HomeTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontFamily: "sans"),
          textAlign: TextAlign.center,
        ),
        const Divider(
            height: 1.0, endIndent: 120, indent: 120, color: Colors.black),
      ],
    );
  }
}
