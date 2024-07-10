import 'package:flutter/material.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Onboarding"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Center(child: Text("onboarding")),
          MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
            color: AppColor.primarycolor,
            child: const Text(
              "Get Started",
              style: TextStyle(color: AppColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
