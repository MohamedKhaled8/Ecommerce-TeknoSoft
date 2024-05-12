import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/themes/e_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/constant/e_shimmer_efect.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/auth/login/controller/user_controller.dart';
import 'package:ecommerce/feature/home/widget/e_custom_card_items.dart/e_custom_badge_number_add_product.dart';

class ECustomHomeAppBAr extends StatelessWidget {
  const ECustomHomeAppBAr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserController _controller =
        Get.put<UserController>(UserController());
    final HomeControllerImp controller = Get.find<HomeControllerImp>();
    return EAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "God Day For Shopping",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: ColorsManger.gray),
          ),
          GetBuilder<UserController>(builder: (_) {
            if (_controller.profileLoading) {
              return EShimmerEffect(width: 75.w, height: 12.h, radius: 0);
            } else {
              return Text(
                _controller.user.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: ColorsManger.white),
              );
            }
          })
        ],
      ),
      action: [
        ECustomBadgeNumberAddProduct(
          onPressed: () {},
        ),
      
      ],
    );
  }
}
