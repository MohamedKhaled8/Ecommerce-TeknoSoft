import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/core/utils/widgets/e_custom_rounded_images.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_icon.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_product_text.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_container.dart';
import 'package:ecommerce/feature/product_screen/widgets/product_review_widget/e_custom_product_title_text.dart';

class ECustomProductCardHorizontal extends StatelessWidget {
  const ECustomProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.w,
      padding: EdgeInsets.all(1.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ELocalSize.productImageRadius.r),
          color: EHelperFunction.isDarkMode(context)
              ? ColorsManger.darkGray
              : ColorsManger.softGray),
      child: Row(
        children: [
          ECustomRoundedContainer(
            height: 115.h,
            padding: EdgeInsets.all(ELocalSize.sm.r),
            backgroundColor: EHelperFunction.isDarkMode(context)
                ? ColorsManger.dark
                : ColorsManger.ligth,
            child: Stack(
              children: [
                SizedBox(
                  width: 115.w,
                  height: 115.h,
                  child: const ECustomRoundedImage(
                    imageUrl: 'assets/images/png/google.png',
                    applyImageRadious: true,
                  ),
                ),
                Positioned(
                  top: 10.h,
                  child: ECustomRoundedContainer(
                    radius: ELocalSize.sm,
                    padding: const EdgeInsets.symmetric(
                        horizontal: ELocalSize.sm, vertical: ELocalSize.xs),
                    backgroundColor: ColorsManger.secoundary.withOpacity(0.8),
                    child: Text(
                      '25%',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: ColorsManger.black,
                          ),
                    ),
                  ),
                ),
                Positioned(
                    top: 0.h,
                    right: 0.w,
                    child: const ECustomCircularIcon(
                      iconData: Iconsax.heart5,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 170.w,
            child: Padding(
              padding:
                  EdgeInsets.only(top: ELocalSize.sm.h, left: ELocalSize.sm.w),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ECustomProductTitleText(
                        title: "Green Nike Half Sleaves Shirt",
                        smallSize: true,
                      ),
                      SizedBox(
                        height: ELocalSize.spaceBtItems.h / 2,
                      ),
                      const ECustomProductTitleText(
                        title: "Nike",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          child: ECustomProductPriceText(price: '256.0 ')),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsManger.dark,
                          borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(ELocalSize.cardRadiuseMd.r),
                              bottomRight: Radius.circular(
                                  ELocalSize.productImageRadius.r)),
                        ),
                        child: SizedBox(
                          width: ELocalSize.iconLg * 1.5.w,
                          height: ELocalSize.iconLg * 1.1.h,
                          child: const Icon(
                            Iconsax.add,
                            color: ColorsManger.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}