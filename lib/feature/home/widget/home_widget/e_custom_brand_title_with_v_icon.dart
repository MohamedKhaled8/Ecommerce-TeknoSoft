import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/enums.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class ECustomBrandTitleWithVIcon extends StatelessWidget {
  final String title;
  final int maxLines;
  final Color? textColor;
  final Color? iconColor;
  final TextAlign? textAlign;
  final TextSizes size;
  const ECustomBrandTitleWithVIcon({
    Key? key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = ColorsManger.primary,
    this.textAlign = TextAlign.center,
    this.size = TextSizes.small,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Flexible(
        //     child: ECustomBrandTileTextHeadingStore(          title: title,
        //   textAlign: textAlign,
        //   color: textColor,
        //   maxLines: maxLines,
        //   brandTextSize: size,
        // )),
        const SizedBox(
          width: ELocalSize.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: ColorsManger.primary,
          size: ELocalSize.iconXs,
        )
      ],
    );
  }
}