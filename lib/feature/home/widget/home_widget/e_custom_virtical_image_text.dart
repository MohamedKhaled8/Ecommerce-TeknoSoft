import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';

class ECustomVirticalImageText extends StatelessWidget {
  final String image;
  final String title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  const ECustomVirticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = ColorsManger.white,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ELocalSize.spaceBtItems),
        child: Column(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              padding: const EdgeInsets.all(ELocalSize.iconSm),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (EHelperFunction.isDarkMode(context)
                          ? ColorsManger.black
                          : ColorsManger.white),
                  shape: BoxShape.circle),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  color: EHelperFunction.isDarkMode(context)
                      ? ColorsManger.ligth
                      : ColorsManger.dark,
                ),
              ),
            ),
            const SizedBox(
              height: ELocalSize.spaceBtItems / 2,
            ),
            SizedBox(
              width: 52.w,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
