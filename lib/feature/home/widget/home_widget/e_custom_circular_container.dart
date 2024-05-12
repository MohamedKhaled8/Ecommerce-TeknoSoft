import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class ECusromCircularContainer extends StatelessWidget {
  final double? width;
  final double? height;

  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backGroundColor;

  const ECusromCircularContainer({
    Key? key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.margin,
    this.child,
    this.backGroundColor = ColorsManger.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backGroundColor),
      child: child,
    );
  }
}
