import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/model/on_boarding_model.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/controller/on_barding_controller.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/widgets/custom_onBarding_page_widget.dart';

class CustomPageViewBuilderWidget extends StatelessWidget {
  const CustomPageViewBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnBardingControllerImp controller =
        Get.find<OnBardingControllerImp>();
    return GetBuilder<OnBardingControllerImp>(builder: (_) {
      return PageView.builder(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return CustomOnBardingPageWidget(
              image: pages[index].image,
              title: pages[index].title.tr,
              subTitle: pages[index].subTitle.tr,
            );
          });
    });
  }
}
