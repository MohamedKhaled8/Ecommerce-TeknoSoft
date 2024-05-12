import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';

class CustomDivierWidget extends StatelessWidget {
  const CustomDivierWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: dark ? ColorsManger.darkGray : ColorsManger.grey,
          thickness: 0.5,
          indent: 60.w,
          endIndent: 5.w,
        )),
        Text(
          "Or Sign With".tr,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
            child: Divider(
          color: dark ? ColorsManger.darkGray : ColorsManger.grey,
          thickness: 0.5,
          indent: 5.w,
          endIndent: 60.w,
        )),
      ],
    );
  }
}