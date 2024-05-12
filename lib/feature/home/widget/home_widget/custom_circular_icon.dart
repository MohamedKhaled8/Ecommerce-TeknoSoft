import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


class ECustomCircularIcon extends StatelessWidget {
  final double? width;
  final double? higth;
  final Color? color;
  final Color? backgroundColor;
  final double? size;
  final IconData iconData;
  final VoidCallback? onTap;
  const ECustomCircularIcon({
    Key? key,
    this.width,
    this.higth,
    this.color,
    this.backgroundColor,
    this.size = ELocalSize.lg,
    required this.iconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: higth,
      decoration: BoxDecoration(
        
          color: backgroundColor != null
              ? backgroundColor!
              : EHelperFunction.isDarkMode(context)
                  ? ColorsManger.black.withOpacity(0.9)
                  : ColorsManger.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
          onPressed: onTap,
          icon: Icon(
            iconData,
            color: color,
            size: size,
          )),
    );
  }
}
