import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_circular_container.dart';

class ECutomIndicatorSlider extends StatelessWidget {
  const ECutomIndicatorSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();
    return GetBuilder<HomeControllerImp>(builder: (_) {
      return Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            _controller.imagesSlider.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: ECusromCircularContainer(
                width: 30.w,
                height: 4.h,
                backGroundColor: _controller.currentIndex == index
                    ? ColorsManger.primary
                    : ColorsManger.gray,
              ),
            ),
          ),
        ),
      );
    });
  }
}
