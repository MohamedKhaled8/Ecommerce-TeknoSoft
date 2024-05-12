import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_form_field.dart';
import 'package:ecommerce/feature/delete_account/controller/delete_account_controller.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountDeletionController _controller =
        Get.put<AccountDeletionController>(AccountDeletionController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.h),
              // Your custom header widget goes here
              SizedBox(height: 50.h),
              Form(
                key: _controller.formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _controller.emailController,
                      obscureText: false,
                      validator: _controller.validateEmail,
                      isNumber: false,
                      iconData: Iconsax.direct_right,
                      labelText: 'E-mail'.tr,
                      isSuffixIcon: false,
                      expands: false,
                    ),
                    SizedBox(height: 10.h),
                    GetBuilder<AccountDeletionController>(builder: (_) {
                      return CustomTextFormField(
                        isSuffixIcon: true,
                        iconData: Iconsax.password_check,
                        labelText: 'Password'.tr,
                        expands: false,
                        isNumber: false,
                        // Bind controller method to show/hide password
                        onPressed: _controller.showPassword,
                        validator: _controller.validatePassword,
                        obscureText: true,
                        suffixIcon: _controller.isShowPassword
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                        // Other properties...
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // Your checkbox and remember me widget goes here
              SizedBox(height: 20.h),
              GetBuilder<AccountDeletionController>(builder: (_) {
                return CustomButtonLocal(
                  // Bind controller method to delete account
                  onTap: _controller.deleteAccount,
                  color: ColorsManger.primary,
                  height: 45.h,
                  isBorder: false,
                  text: 'DeleteAcount',
                  width: 320.w,
                  // Other properties...
                );
              }),
              // Other UI elements...
            ],
          ),
        ),
      ),
    );
  }
}
