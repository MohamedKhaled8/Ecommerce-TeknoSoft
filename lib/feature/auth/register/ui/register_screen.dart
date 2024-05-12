import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';
import 'package:ecommerce/feature/auth/login/widget/custom_divider_widget.dart';
import 'package:ecommerce/feature/auth/register/controller/sign_up_controller.dart';
import 'package:ecommerce/feature/auth/login/widget/custom_auth_social_widget.dart';
import 'package:ecommerce/feature/auth/register/widgets/custom_form_field_register_screen.dart';
import 'package:ecommerce/feature/auth/register/widgets/custom_checkbox_and_textspan_register_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpControllerImp _controller =
        Get.put<SignUpControllerImp>(SignUpControllerImp());
    final dark = EHelperFunction.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? ColorsManger.black : ColorsManger.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Letes Create Your Account".tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20.h,
              ),
              const CustomFormFieldRegisterScreen(),
              const CustomCheckBoxAndTextSpanRegisterWidget(),
              SizedBox(
                height: 15.h,
              ),
              CustomButtonLocal(
                width: 300.w,
                height: 40.h,
                isBorder: false,
                color: Colors.blue,
                text: "Create Account",
                customTextColor: ColorsManger.white,
                onTap: () {
                  _controller.signUp();
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              const CustomDivierWidget(),
              SizedBox(
                height: 15.h,
              ),
              const CustomAuthSocailWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
