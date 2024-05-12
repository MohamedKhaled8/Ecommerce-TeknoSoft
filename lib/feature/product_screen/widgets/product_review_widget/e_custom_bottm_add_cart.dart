import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_icon.dart';
class ECustomBottomAddCart extends StatelessWidget {



  const ECustomBottomAddCart({super.key,});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      padding: const EdgeInsets.symmetric(
          horizontal: ELocalSize.defaultSpace,
          vertical: ELocalSize.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? ColorsManger.darkGray : ColorsManger.ligth,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(ELocalSize.cardRadiuseLg),
              topRight: Radius.circular(ELocalSize.cardRadiuseLg))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ECustomCircularIcon(
                iconData: Iconsax.minus,
                backgroundColor: ColorsManger.black,
                width: 35.w,
                higth: 35.h,
                color: ColorsManger.white,
              ),
              const SizedBox(
                width: ELocalSize.spaceBtItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: ELocalSize.spaceBtItems,
              ),
              ECustomCircularIcon(
                iconData: Iconsax.add,
                backgroundColor: ColorsManger.black,
                width: 35.w,
                higth: 35.h,
                color: ColorsManger.white,
              ),
            ],
          ),
          CustomButtonLocal(
              width: 150.w,
              height: 50.h,
              color: ColorsManger.primary,
              isBorder: false,
              text: "Add To Card",
              borderRadius: 10,
              onTap: () {})
        ],
      ),
    );
  }
}