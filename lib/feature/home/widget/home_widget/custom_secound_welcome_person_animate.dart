import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScoundWelcomePerosnAnimate extends StatelessWidget {
  const CustomScoundWelcomePerosnAnimate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
          color: Colors.white, fontSize: 25.sp, fontWeight: FontWeight.bold),
      child: AnimatedTextKit(animatedTexts: [
        TypewriterAnimatedText("Hello! Welcome to the app!".tr,
            speed: const Duration(milliseconds: 100)),
        TypewriterAnimatedText("We're happy to have you here!".tr,
            speed: const Duration(milliseconds: 100)),
        TypewriterAnimatedText("Enjoy your time with us!".tr,
            speed: const Duration(milliseconds: 100)),
      ]),
    );
  }
}
