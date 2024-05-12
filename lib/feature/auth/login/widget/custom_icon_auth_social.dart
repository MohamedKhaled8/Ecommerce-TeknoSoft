import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';

class CustomIconAuthSocial extends StatelessWidget {
  final Widget iconData;
  final Function()? onPressed;
  const CustomIconAuthSocial({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: dark ? ColorsManger.white : ColorsManger.black),
          shape: BoxShape.circle),
      child: IconButton(
        onPressed: onPressed,
        icon: iconData,
        iconSize: 34.h,
      ),
    );
  }
}
