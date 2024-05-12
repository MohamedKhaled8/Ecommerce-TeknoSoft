import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class EChipTheme {
  EChipTheme._();

  static ChipThemeData ligthChipTheme = ChipThemeData(
      disabledColor: ColorsManger.gray.withOpacity(0.4),
      labelStyle: const TextStyle(color: ColorsManger.black),
      selectedColor: ColorsManger.primary,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      checkmarkColor: ColorsManger.white);

  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor: ColorsManger.darkGray,
      labelStyle: const TextStyle(color: ColorsManger.white),
      selectedColor: ColorsManger.primary,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      checkmarkColor: ColorsManger.white);
}
