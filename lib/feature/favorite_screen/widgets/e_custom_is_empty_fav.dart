import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_local.dart';

class ECustomIsEmptyFav extends StatelessWidget {
  const ECustomIsEmptyFav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/json/heart.json',
            width: 300.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextLocal(
            text: "Please, Add your favorite proudcts".tr,
            color: EHelperFunction.isDarkMode(context)
                ? ColorsManger.red
                : ColorsManger.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.normal,
          )
        ],
      ),
    );
  }
}
// Get.locale!.languageCode == 'ar' ? 300.w : 100.w,