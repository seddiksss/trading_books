import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:trading_books/Controllers/onboardingScreenController.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("OnboardingScreen"),
      //   centerTitle: true,
      // ),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpeg"),
                  fit: BoxFit.cover)),
          child: GetBuilder<OnboardingScreenController>(
              builder: (controller) => IntroductionScreen(
                    pages: controller.listPagesViewModel,
                    showSkipButton: true,
                    skip: const Icon(Icons.skip_next),
                    next: const Text("Next"),
                    done: const Text("Done",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    onDone: () {
                      Get.toNamed(AppRoutes.singin);
                    },
                    onSkip: () {
                      // On Skip button pressed
                    },
                    dotsDecorator: DotsDecorator(
                      size: const Size.square(10.0),
                      activeSize: const Size(20.0, 10.0),
                      activeColor: Theme.of(context).colorScheme.secondary,
                      color: Colors.black26,
                      spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                    ),
                  ))),
    );
  }
}
