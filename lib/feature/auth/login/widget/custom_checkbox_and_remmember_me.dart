import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/auth/login/controller/login_controller.dart';

class CustomCheckBoxAndRemmemberMeWidget extends StatelessWidget {
  const CustomCheckBoxAndRemmemberMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp _controller = Get.find<LoginControllerImp>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GetBuilder<LoginControllerImp>(builder: (_) {
              return Checkbox.adaptive(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                side: const BorderSide(color: ColorsManger.blue),
                value: _controller.rememberMe,
                onChanged: (value) {
                  
                  _controller.togglePrivacyPolicy();
                },
              );
            }),
             Text("Remember Me".tr),
          ],
        ),
        TextButton(
          onPressed: () => Get.toNamed(AppRoute.forgetPassword),
          child:  Text("Forgot Password ?".tr),
        ),
      ],
    );
  }
}
