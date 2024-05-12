import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/controller/on_barding_controller.dart';

class CustomNetButtonOnBardingWidget extends StatelessWidget {
  const CustomNetButtonOnBardingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale!.languageCode == 'ar';

    final dark = EHelperFunction.isDarkMode(context);
    final OnBardingControllerImp controller =
        Get.find<OnBardingControllerImp>();
    return GetBuilder<OnBardingControllerImp>(builder: (_) {
      return Positioned(
        right: isArabic ? 0 : 10.w,
        bottom: isArabic ? 0 : 10.h,
        child: InkWell(
          onTap: () => controller.nextPage(),
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: dark ? ColorsManger.primary : ColorsManger.black,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child:
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
            ),
          ),
        ),
      );
    });
  }
}
