import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/themes/e_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/core/utils/widgets/e_custom_rounded_images.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_icon.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_curved_home_screen.dart';

class ECustomProductImageSlider extends StatelessWidget {
  const ECustomProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);

    return CustomECurvedHomeScreenWidget(
        child: Container(
      color: dark ? ColorsManger.darkGray : ColorsManger.ligth,
      child: Stack(
        children: [
          SizedBox(
            height: 370.h,
            child: Padding(
              padding: const EdgeInsets.all(ELocalSize.productImageRadius * 2),
              child: Center(
                child: Image.asset("assets/images/png/facebook.png"),
              ),
            ),
          ),
          Positioned(
            right: 0.w,
            bottom: 25.w,
            left: ELocalSize.defaultSpace,
            child: SizedBox(
              height: 75.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ECustomRoundedImage(
                      width: 75.w,
                      backgroundColor:
                          dark ? ColorsManger.dark : ColorsManger.white,
                      border: Border.all(color: ColorsManger.primary),
                      padding: const EdgeInsets.all(ELocalSize.sm),
                      imageUrl: "assets/images/png/facebook.png",
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                        width: ELocalSize.spaceBtItems,
                      ),
                  itemCount: 6),
            ),
          ),
          const EAppBar(
            showBackArrowButton: true,
            action: [
              ECustomCircularIcon(
                iconData: Iconsax.heart5,
                color: ColorsManger.red,
              )
            ],
          )
        ],
      ),
    ));
  }
}