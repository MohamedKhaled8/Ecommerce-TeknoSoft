import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class EShadow {
  static final verticalProductShadow = BoxShadow(
      color: ColorsManger.darkGray.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));


  static final horizontalProductShadow = BoxShadow(
      color: ColorsManger.darkGray.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
