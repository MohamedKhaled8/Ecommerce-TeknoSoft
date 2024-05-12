import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/e_shimmer_efect.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_body_slider.dart';

class ECustomPromoSlider extends StatelessWidget {
  const ECustomPromoSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();

    return GetBuilder<HomeControllerImp>(builder: (_) {
      if (_controller.isLoadingg) {
        return EShimmerEffect(width: double.infinity, height: 180.h, radius: 0);
      }
      if (_controller.banner.isEmpty) {
        return const Center(
          child: Text("No Data Found"),
        );
      } else {
        return const ECustomBodySlider();
      }
    });
  }
}
