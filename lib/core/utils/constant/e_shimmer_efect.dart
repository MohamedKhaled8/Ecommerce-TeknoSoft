import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class EShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? color;
  const EShimmerEffect({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color:
                  color ?? (dark ? ColorsManger.darkGray : ColorsManger.white) , 
                  borderRadius: BorderRadius.circular(radius)
                  ),
                  
        ));
  }
}
