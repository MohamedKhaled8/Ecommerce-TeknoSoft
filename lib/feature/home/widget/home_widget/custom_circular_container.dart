import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class ECustomRoundedContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color backgroundColor;
  final Color borderColor;
  const ECustomRoundedContainer({
    Key? key,
    this.width,
    this.height,
    this.radius = ELocalSize.cardRadiuseLg,
    this.padding,
    this.margin,
    this.child,
    this.showBorder = false,
    this.borderColor = ColorsManger.primary,
    this.backgroundColor = ColorsManger.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          border: showBorder ? Border.all(color: borderColor) : null,
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor),
      child: child,
    );
  }
}
