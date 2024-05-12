import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class CustomNotificationHomeScreenWiget extends StatelessWidget {
  const CustomNotificationHomeScreenWiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: ColorsManger.gray,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.shopping_bag,
                color: ColorsManger.black,
              )),
        ),
        Positioned(
          right: 0.w,
          child: Container(
            width: 15.w,
            height: 15.h,
            decoration: BoxDecoration(
              color: ColorsManger.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: ColorsManger.white, fontSizeFactor: 0.8.sp),
              ),
            ),
          ),
        )
      ],
    );
  }
}