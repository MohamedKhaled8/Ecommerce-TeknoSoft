import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/controller/on_barding_controller.dart';

class CustomOnBardingSkipWidget extends StatelessWidget {
  const CustomOnBardingSkipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnBardingControllerImp controller =
        Get.find<OnBardingControllerImp>();
    return Positioned(
        right: 0.w,
        top: 30.h,
        child: Container(
          margin: EdgeInsets.only(top: 10.h, right: 10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorsManger.gray.withOpacity(0.3)),
          child: TextButton(
            onPressed: () => controller.skipPage(),
            child:  Text("Skip".tr),
          ),
        ));
  }
}
