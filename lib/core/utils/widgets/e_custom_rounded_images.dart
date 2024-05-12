import '../device/e_local_size.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class ECustomRoundedImage extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width;
  final double? hight;
  final BoxBorder? border;
  final Color backgroundColor;
  final double borderRadious;
  final bool applyImageRadious;
  final bool isNetworImage;
  final String imageUrl;
  final BoxFit? fit;
  final Color? overLayColor;
  final EdgeInsetsGeometry? padding;
  const ECustomRoundedImage({
    Key? key,
    this.onPressed,
    this.width = 56,
    this.hight = 56,
    this.border,
    this.overLayColor,
    this.backgroundColor = ColorsManger.ligth,
    this.borderRadious = ELocalSize.md,
    this.applyImageRadious = true,
    this.isNetworImage = false,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: hight,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadious)),
        child: ClipRRect(
            borderRadius: applyImageRadious
                ? BorderRadius.circular(borderRadious)
                : BorderRadius.zero,
            child: Image(
              image: isNetworImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}
