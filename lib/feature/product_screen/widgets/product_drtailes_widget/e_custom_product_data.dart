import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/enums.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_round_image.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_product_text.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_container.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_brand_title_with_v_icon.dart';

class ECustomProductData extends StatelessWidget {
  const ECustomProductData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ECustomRoundedContainer(
                radius: ELocalSize.sm,
                backgroundColor: ColorsManger.secoundary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: ELocalSize.sm, vertical: ELocalSize.xs),
                child: Text(
                  '25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: ColorsManger.black),
                ),
              ),
              const SizedBox(
                width: ELocalSize.spaceBtItems,
              ),
              Text(
                '250%',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
              const SizedBox(
                width: ELocalSize.spaceBtItems,
              ),
              const ECustomProductPriceText(
                price: '1850',
                isLarge: true,
              ),
            ],
          ),
          const SizedBox(
            height: ELocalSize.spaceBtItems / 1.5,
          ),
          const ECustomProductPriceText(
            price: 'Green Nike Sport Shirt',
            isLarge: true,
          ),
          const SizedBox(
            height: ELocalSize.spaceBtItems / 1.5,
          ),
          Row(
            children: [
              const ECustomProductPriceText(
                price: 'Status',
              ),
              const SizedBox(
                width: ELocalSize.spaceBtItems,
              ),
              Text('In Stack', style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
          const SizedBox(
            height: ELocalSize.spaceBtItems / 1.5,
          ),
          Row(
            children: [
              ECustomCircularImage(
                imageUrl: "assets/images/png/facebook.png",
                width: 30.w,
                height: 30.h,
                overlayColor: dark ? ColorsManger.white : ColorsManger.black,
              ),
              const SizedBox(
                width: ELocalSize.spaceBtItems,
              ),
              const ECustomBrandTitleWithVIcon(
                title: 'Nike',
                size: TextSizes.medium,
              )
            ],
          )
        ],
      ),
    );
  }
}
