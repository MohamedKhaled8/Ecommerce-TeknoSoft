import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class EHelperFunction {
  static Color? getColor(String value) {
    switch (value) {
      case 'Green':
        return ColorsManger.green;
      case 'Red':
        return ColorsManger.red;
      case 'Blue':
        return ColorsManger.blue;
      case 'Pink':
        return ColorsManger.pink;
      case 'Gray':
        return ColorsManger.gray;
      case 'Orange':
        return ColorsManger.orange;
      case 'Yellow':
        return ColorsManger.orange;

      case 'Purple':
        return ColorsManger.purple;
      case 'Black':
        return ColorsManger.black;
      case 'White':
        return ColorsManger.white;
      case 'Brown':
        return ColorsManger.brown;
      case 'Teal':
        return ColorsManger.teal;
      case 'Indigo':
        return ColorsManger.indigo;
      default:
        return null; // If the value doesn't match any case, return null
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
