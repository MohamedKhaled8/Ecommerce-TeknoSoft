import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/auth/login/controller/user_controller.dart';

class CustomFirstWelomePersonAnimate extends StatelessWidget {
  const CustomFirstWelomePersonAnimate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();
    final UserController _controllerUser = UserController.instance;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 10.w,
          height: 80.h,
        ),
        Text(
          "Welcome",
          style: TextStyle(
              color: ColorsManger.white,
              fontSize: 26.sp,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10.w,
          height: 80.h,
        ),
        DefaultTextStyle(
          style: TextStyle(
              color: ColorsManger.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold),
          child: AnimatedTextKit(animatedTexts: [
            RotateAnimatedText(_controllerUser.user.fullName),
            // RotateAnimatedText("Lady"),
          ]),
        ),
      ],
    );
  }
}
