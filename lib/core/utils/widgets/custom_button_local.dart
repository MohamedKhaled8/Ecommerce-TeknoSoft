import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';

class CustomButtonLocal extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double? borderRadius;
  final BoxBorder? border;
  final bool isBorder;
  final String text;
  final void Function()? onTap;
  final Color? customTextColor; 

  const CustomButtonLocal({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    this.borderRadius,
    this.border,
    required this.isBorder,
    required this.text,
    required this.onTap,
    this.customTextColor, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    final textColor = customTextColor ?? (dark ? ColorsManger.white : ColorsManger.black); // Use customTextColor if provided, otherwise use default based on dark mode

    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
            color: isBorder ? Colors.transparent : color,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

