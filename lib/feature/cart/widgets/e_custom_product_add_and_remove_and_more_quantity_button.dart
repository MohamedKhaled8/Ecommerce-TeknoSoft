import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_icon.dart';


class ECustomProductAddAndRemoveAndMoreQuantityButton extends StatelessWidget {
  const ECustomProductAddAndRemoveAndMoreQuantityButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ECustomCircularIcon(
          iconData: Iconsax.minus,
          width: 30.w,
          higth: 30.h,
          size: ELocalSize.md.h,
          color: EHelperFunction.isDarkMode(context)
              ? ColorsManger.white
              : ColorsManger.black,
          backgroundColor: EHelperFunction.isDarkMode(context)
              ? ColorsManger.darkGray
              : ColorsManger.ligth,
        ),
        SizedBox(
          width: ELocalSize.spaceBtItems.w,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          width: ELocalSize.spaceBtItems.w,
        ),
        ECustomCircularIcon(
            iconData: Iconsax.add,
            width: 30.w,
            higth: 30.h,
            size: ELocalSize.md.h,
            color: ColorsManger.white,
            backgroundColor: ColorsManger.primary)
      ],
    );
  }
}