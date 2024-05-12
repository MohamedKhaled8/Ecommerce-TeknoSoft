import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../core/Router/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/validation/app_regex.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_form_field.dart';
import 'package:ecommerce/feature/auth/login/controller/login_controller.dart';
import 'package:ecommerce/feature/auth/login/widget/custom_divider_widget.dart';
import 'package:ecommerce/feature/auth/login/widget/custom_auth_social_widget.dart';
import 'package:ecommerce/feature/auth/login/widget/custom_checkbox_and_remmember_me.dart';
import 'package:ecommerce/feature/auth/login/widget/custom_header_login_screen_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp _controller =
        Get.put<LoginControllerImp>(LoginControllerImp());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.h),
              const CustomHeaderLoginScreenWidget(),
              SizedBox(height: 50.h),
              Form(
                  key: _controller.formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _controller.emailController,
                        obscureText: false,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !AppRegex.isEmailValid(value)) {
                            return "Please enter a valid email".tr;
                          }
                        },
                        isNumber: false,
                        iconData: Iconsax.direct_right,
                        labelText: 'E-mail'.tr,
                        isSuffixIcon: false,
                        expands: false,
                      ),
                      SizedBox(height: 10.h),
                      GetBuilder<LoginControllerImp>(builder: (_) {
                        return CustomTextFormField(
                          isSuffixIcon: true,
                          onPressed: _controller.showPassword,
                          controller: _controller.passwordController,
                          iconData: Iconsax.password_check,
                          labelText: 'Password'.tr,
                          suffixIcon: _controller.isShowPassword
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                          expands: false,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !AppRegex.isPasswordValid(value)) {
                              return "Please enter a valid password".tr;
                            }
                          },
                          isNumber: false,
                          obscureText: _controller.isShowPassword,
                        );
                      }),
                    ],
                  )),
              SizedBox(height: 20.h),
              const CustomCheckBoxAndRemmemberMeWidget(),
              SizedBox(height: 20.h),
              GetBuilder<LoginControllerImp>(builder: (_) {
                return CustomButtonLocal(
                    width: 300.w,
                    height: 40.h,
                    isBorder: false,
                    color: ColorsManger.blue,
                    text: "Sign In".tr,
                    customTextColor: ColorsManger.white,
                    onTap: () {
                      _controller.loginUser(
                          );
                    });
              }),
              SizedBox(height: 10.h),
              CustomButtonLocal(
                width: 300.w,
                height: 40.h,
                isBorder: true,
                border: Border.all(color: Colors.grey),
                color: ColorsManger.blue,
                text: "Create Account".tr,
                onTap: () => Get.toNamed(AppRoute.registerScreen),
              ),
              SizedBox(height: 10.h),
              const CustomDivierWidget(),
              SizedBox(height: 20.h),
              const CustomAuthSocailWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
