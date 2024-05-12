import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/themes/e_text_theme.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/themes/e_checkbox_theme.dart';
import 'package:ecommerce/core/utils/themes/e_text_field_theme.dart';
import 'package:ecommerce/core/utils/themes/e_bottom_sheet_theme.dart';

class EAppTheme {
  EAppTheme._();

  static ThemeData ligthTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: ColorsManger.blue,
    scaffoldBackgroundColor: ColorsManger.white,
    textTheme: ETextTheme.lightTextTheme(),
    checkboxTheme: ECheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: EBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: ETextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: ColorsManger.blue,
    scaffoldBackgroundColor: ColorsManger.black,
    textTheme: ETextTheme.darkTextTheme(),
    checkboxTheme: ECheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: EBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: ETextFormFieldTheme.darkInputDecorationTheme,
  );
}
