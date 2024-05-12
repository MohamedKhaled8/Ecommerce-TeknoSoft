import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_circular_container.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_curved_home_screen.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


class CustomEPrimaryHeaderContainer extends StatelessWidget {
  final double height;
  final Widget child;
  const CustomEPrimaryHeaderContainer({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomECurvedHomeScreenWidget(
      child: SizedBox(
        height: height,
        child: Container(
          color: ColorsManger.primary,
          child: Stack(
            children: [
              Positioned(
                top: -120.h,
                right: -250.w,
                child: ECusromCircularContainer(
                  backGroundColor: ColorsManger.textWithe.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100.h,
                right: -300.w,
                child: ECusromCircularContainer(
                  backGroundColor: ColorsManger.textWithe.withOpacity(0.1),
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
