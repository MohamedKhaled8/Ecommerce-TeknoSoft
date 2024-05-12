import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/core/utils/widgets/e_custom_rounded_images.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_brand_title_with_v_icon.dart';
import 'package:ecommerce/feature/product_screen/widgets/product_review_widget/e_custom_product_title_text.dart';

class ECustomCartItem extends StatelessWidget {
  const ECustomCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ECustomRoundedImage(
          imageUrl: 'assets/images/png/google.png',
          width: 65.w,
          hight: 65.h,
          padding: EdgeInsets.all(ELocalSize.sm.r),
          backgroundColor: EHelperFunction.isDarkMode(context)
              ? ColorsManger.darkGray
              : ColorsManger.ligth,
        ),
        SizedBox(
          width: ELocalSize.spaceBetweenSection.w,
        ),
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ECustomBrandTitleWithVIcon(
              title: 'Nike',
            ),
            const Flexible(
                child: ECustomProductTitleText(
              title: 'Black Sport Shoes Nike Adidas Moham ',
              maxLines: 1,
            )),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Color', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: 'Size', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'Uk 08', style: Theme.of(context).textTheme.bodyLarge),
            ]))
          ],
        ))
      ],
    );
  }
}