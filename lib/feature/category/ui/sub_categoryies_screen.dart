import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/category/controller/category_controller.dart';
import 'package:ecommerce/feature/category/widgets/custom_category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryControllerImp _controller =
        Get.put<CategoryControllerImp>(CategoryControllerImp());
    final HomeControllerImp _controllerH =
        Get.put<HomeControllerImp>(HomeControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(left: 15.w, top: 15.h),
          child: Column(
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Category'.tr,
                      textStyle: TextStyle(fontSize: 25.sp)),
                ],
                isRepeatingAnimation: true,
                onTap: () {},
              ),
              SizedBox(
                height: 15.h,
              ),
              const CustomCategoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
