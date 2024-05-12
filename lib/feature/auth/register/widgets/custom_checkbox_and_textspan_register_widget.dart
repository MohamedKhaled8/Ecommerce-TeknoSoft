import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/auth/register/controller/sign_up_controller.dart';
import 'package:ecommerce/feature/auth/register/widgets/custom_textspan_widget.dart';

class CustomCheckBoxAndTextSpanRegisterWidget extends StatelessWidget {
  const CustomCheckBoxAndTextSpanRegisterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignUpControllerImp _controller = Get.find<SignUpControllerImp>();
    return Row(
      children: [
        SizedBox(
            width: 30.w,
            height: 30.h,
            child: GetBuilder<SignUpControllerImp>(
              builder: (_) {
                return Checkbox.adaptive(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: const BorderSide(color: ColorsManger.blue),
                  value: _controller.privacePolicy,
                  onChanged: (value) {
                    _controller.togglePrivacyPolicy();
                  },
                );
              },
            )),
        SizedBox(
          width: 10.w,
        ),
        const CustomTextSpanWidget()
      ],
    );
  }
}
