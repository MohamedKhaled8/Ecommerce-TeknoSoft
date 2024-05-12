import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/controller/on_barding_controller.dart';

class CustomSmoothIndicatorNavigationWidget extends StatelessWidget {
  const CustomSmoothIndicatorNavigationWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final OnBardingControllerImp controller =
        Get.find<OnBardingControllerImp>();
    final dark = EHelperFunction.isDarkMode(context);
    final isArabic = Get.locale!.languageCode == 'ar';

    return GetBuilder<OnBardingControllerImp>(builder: (_) {
      return Positioned(
          left: isArabic ? 10.w : 10.w,
          bottom: isArabic ? 10.w : 10.w,
          child: SmoothPageIndicator(
            controller: controller.pageController,
            onDotClicked: controller.dottiedNavClick,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: dark ? ColorsManger.primary : ColorsManger.dark,
              dotHeight: 6.h,
            ),
          ));
    });
  }
}
