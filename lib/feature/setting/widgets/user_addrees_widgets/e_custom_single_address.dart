import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_container.dart';

class ECustomSingleAddress extends StatelessWidget {
  final bool selectedAddress;
  const ECustomSingleAddress({
    Key? key,
    required this.selectedAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ECustomRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(ELocalSize.md),
      backgroundColor: selectedAddress
          ? ColorsManger.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : EHelperFunction.isDarkMode(context)
              ? ColorsManger.darkGray
              : ColorsManger.gray,
      margin: const EdgeInsets.only(bottom: ELocalSize.spaceBtItems),
      child: Stack(
        children: [
          Positioned(
            right: 5.w,
            top: 0.h,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? EHelperFunction.isDarkMode(context)
                        ? ColorsManger.ligth
                        : ColorsManger.dark.withOpacity(0.2)
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mohamed Khaled",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: ELocalSize.sm / 2,
              ),
              const Text(
                "(+123) 456 7890",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: ELocalSize.sm / 2,
              ),
              const Text(
                "3 Helan , Cairo  , Egypt , 98989 , EG",
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
