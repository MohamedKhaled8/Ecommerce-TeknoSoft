import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class ECustomCardContainerIcon extends StatelessWidget {
  final Color iconColor;
  final VoidCallback onPressed;
  const ECustomCardContainerIcon({
    Key? key,
    required this.iconColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.toNamed(AppRoute.cartScreen),
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
            right: 0.w,
            child: Container(
              width: 20.w,
              height: 18.h,
              decoration: BoxDecoration(
                  color: ColorsManger.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text(
                  '2',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: ColorsManger.white, fontSizeFactor: 0.8),
                ),
              ),
            ))
      ],
    );
  }
}
