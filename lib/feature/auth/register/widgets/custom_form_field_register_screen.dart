import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/validation/app_regex.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_form_field.dart';
import 'package:ecommerce/feature/auth/register/controller/sign_up_controller.dart';

class CustomFormFieldRegisterScreen extends StatelessWidget {
  const CustomFormFieldRegisterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignUpControllerImp _controller = Get.find<SignUpControllerImp>();

    return GetBuilder<SignUpControllerImp>(builder: (_) {
      return Form(
          key: _controller.formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: CustomTextFormField(
                    isSuffixIcon: false,
                    controller: _controller.firstNameCont,
                    expands: false,
                    labelText: "First Name".tr,
                    iconData: Icons.person_2_outlined,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a valid User First Name".tr;
                      }
                    },
                    isNumber: false,
                  )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      controller: _controller.lastNameCont,
                      expands: false,
                      labelText: "Last Name".tr,
                      isSuffixIcon: false,
                      iconData: Icons.person_2_outlined,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid User Last Name".tr;
                        }
                      },
                      isNumber: false,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                isSuffixIcon: false,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid User User Name".tr;
                  }
                },
                isNumber: false,
                controller: _controller.userNamCont,
                iconData: Iconsax.user,
                labelText: 'User Name'.tr,
                expands: false,
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                isSuffixIcon: false,
                obscureText: false,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return "Please enter a valid E-mail".tr;
                  }
                },
                isNumber: false,
                controller: _controller.emailCont,
                iconData: Iconsax.direct,
                labelText: 'E-mail'.tr,
                expands: false,
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                isSuffixIcon: false,
                obscureText: false,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.hasNumber(value)) {
                    return "Please enter a valid Phone Number".tr;
                  }
                },
                isNumber: true,
                controller: _controller.phoneNumberCont,
                iconData: Iconsax.call,
                labelText: 'Phone Number'.tr,
                expands: false,
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                isSuffixIcon: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid Password".tr;
                  }
                },
                isNumber: false,
                obscureText: _controller.isshowpassword,
                onPressed: () {
                  _controller.showPassword();
                },
                controller: _controller.passwordCont,
                iconData: Iconsax.password_check,
                labelText: 'Password'.tr,
                suffixIcon: _controller.isshowpassword
                    ? Iconsax.eye_slash
                    : Iconsax.eye,
                expands: false,
              ),
              SizedBox(height: 10.h),
            ],
          ));
    });
  }
}
