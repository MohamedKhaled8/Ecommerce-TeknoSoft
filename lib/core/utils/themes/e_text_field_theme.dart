import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class ETextFormFieldTheme {
  // Private constructor
  ETextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ColorsManger.grey,
    suffixIconColor: ColorsManger.grey,
    labelStyle: TextStyle(
      fontSize: 14.0.sp,
      color: ColorsManger.black,
    ),
    hintStyle: TextStyle(
      fontSize: 14.0.sp,
      color: ColorsManger.black,
    ),
    errorStyle: const TextStyle(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: TextStyle(
      color: ColorsManger.black.withOpacity(0.8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        width: 1.0.w,
        color: ColorsManger.grey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        width: 1.0.w,
        color: ColorsManger.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        width: 1.0.w,
        color: Colors.black12,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        width: 1.0.w,
        color: ColorsManger.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        width: 2.0.w,
        color: ColorsManger.orange,
      ),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ColorsManger.grey,
    suffixIconColor: ColorsManger.grey,
    labelStyle: TextStyle(
      fontSize: 14.0.sp,
      color: ColorsManger.white,
    ),
    hintStyle: TextStyle(
      fontSize: 14.0.sp,
      color: ColorsManger.white,
    ),
    errorStyle: const TextStyle(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: TextStyle(
      color: ColorsManger.white.withOpacity(0.8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        width: 1.0.w,
        color: ColorsManger.grey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        width: 1.0.w,
        color: ColorsManger.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        width: 1.0.w,
        color: ColorsManger.white,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        width: 1.0.w,
        color: ColorsManger.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(
        width: 2.0.w,
        color: ColorsManger.orange,
      ),
    ),
  );
}
