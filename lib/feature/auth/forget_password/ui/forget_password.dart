import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/validation/app_regex.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_form_field.dart';
import 'package:ecommerce/feature/auth/forget_password/controller/reset_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    final ForgetPasswordControllerImp _controller =
        Get.put<ForgetPasswordControllerImp>(ForgetPasswordControllerImp());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? ColorsManger.black : ColorsManger.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/json/forget.json',
                width: 200.w,
                height: 200.h,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: ELocalSize.defaultSpace.h,
              ),
              Text(
                "ForgetPassword".tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 5.h),
              Text(
                  "Dont worry somthing peopele can forget too. enter your email and we will send you a password reser link."
                      .tr,
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: 20.h),
              CustomTextFormField(
                isSuffixIcon: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid E-mail".tr;
                  }
                },
                iconData: Iconsax.direct_right,
                labelText: 'E-mail'.tr,
                expands: false,
                isNumber: false,
                obscureText: false,
                controller: _controller.emailController,
              ),
              SizedBox(height: 30.h),
              GetBuilder<ForgetPasswordControllerImp>(builder: (_) {
                return CustomButtonLocal(
                  width: 300.w,
                  height: 40.h,
                  isBorder: false,
                  color: Colors.blue,
                  text: "Reset Password".tr,
                  onTap: () {
                    _controller.resetPassword();
                  },
                );
              }),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    ));
  }
}
