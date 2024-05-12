import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';
import 'package:ecommerce/feature/auth/verify_code/controller/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String? email;
  const VerifyEmailScreen({
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VerifyControllerImp _controller =
        Get.put<VerifyControllerImp>(VerifyControllerImp());
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/json/verify.json',
                width: 200.w,
                height: 200.h,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 20.h),
              Text(
                "Verify your email address!".tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 5.h),
              Text("suppor ${email ?? ""} ",
                  style: Theme.of(context).textTheme.labelLarge),
              SizedBox(height: 5.h),
              Text(
                  "congratulations Your Account Aeaites: Verify Your Email to Start Shopping and Experience a world of Univaled  Deals and Personalized Offers"
                      .tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: 60.h),
              CustomButtonLocal(
                width: 300.w,
                height: 40.h,
                isBorder: false,
                color: Colors.blue,
                text: "Continue".tr,
                customTextColor: ColorsManger.white,
                onTap: () {
                  _controller.checkEmailVerifyStatus();
                },
              ),
              SizedBox(height: 20.h),
              CustomButtonLocal(
                width: 300.w,
                height: 40.h,
                isBorder: true,
                border: Border.all(color: Colors.grey),
                color: Colors.blue,
                text: "Resed Email".tr,
                onTap: () {
                  _controller.sendEmailVerification();
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
