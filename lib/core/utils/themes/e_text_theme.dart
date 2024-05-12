import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class ETextTheme {
  ETextTheme._();

  // Define a light text theme
  static TextTheme lightTextTheme() {
    return TextTheme(
      headlineLarge:   TextStyle(
        fontSize: 32.0.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.black,
      ),
      headlineMedium:   TextStyle(
        fontSize: 24.0.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.black,
      ),
      headlineSmall:   TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.black,
      ),
      titleLarge:   TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.black,
      ),
      titleMedium:   TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManger.black,
      ),
      titleSmall:   TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManger.black,
      ),
      bodyLarge:   TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManger.black,
      ),
      bodyMedium:   TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManger.black,
      ),
      bodySmall:  TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManger.black.withOpacity(0.5),
      ),
      labelLarge:   TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManger.black,
      ),
      labelMedium:  TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManger.black.withOpacity(0.5),
      ),
    );
  }

  // Define a dark text theme
  static TextTheme darkTextTheme() {
    return TextTheme(
      headlineLarge:   TextStyle(
        fontSize: 32.0.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
      headlineMedium:   TextStyle(
        fontSize: 24.0.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
      headlineSmall:   TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
      titleLarge:   TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
      titleMedium:   TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManger.white,
      ),
      titleSmall:   TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManger.white,
      ),
      bodyLarge:   TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManger.white,
      ),
      bodyMedium:   TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManger.white,
      ),
      bodySmall:  TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManger.white.withOpacity(0.5),
      ),
      labelLarge:   TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManger.white,
      ),
      labelMedium:  TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManger.white.withOpacity(0.5),
      ),
    );
  }
}
