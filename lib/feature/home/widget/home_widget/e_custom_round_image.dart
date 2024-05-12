import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class ECustomCircularImage extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final BoxBorder? border;
  final Color backgroundColor;
  final double borderRadius;
  final bool applyImageRadius;
  final bool isNetworkImage;
  final String imageUrl;
  final BoxFit? fit;
  final Color? overlayColor;
  final double padding;

  const ECustomCircularImage({
    Key? key,
    this.onPressed,
    this.width = 56,
    this.height = 56,
    this.border,
    this.overlayColor,
    this.backgroundColor = ColorsManger.ligth,
    this.borderRadius = 28,
    this.applyImageRadius = false,
    this.isNetworkImage = false,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.padding = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: border,
          color: backgroundColor,
        ),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
