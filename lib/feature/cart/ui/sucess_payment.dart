import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(
                      'assets/json/payment.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Payment successful",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            CustomButtonLocal(
              width: 320.w,
              height: 45.h,
              color: ColorsManger.primary,
              customTextColor: ColorsManger.white,
              isBorder: false,
              text: "Go Back",
              onTap: () => Get.toNamed(AppRoute.buttonBavBar),
            ),
          ],
        ),
      ),
    );
  }
}
