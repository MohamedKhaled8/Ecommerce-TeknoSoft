import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/cart/controller/cart_controller.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_card_container_icon.dart';

class ECustomBadgeNumberAddProduct extends StatelessWidget {
  final Function()? onPressed;
  ECustomBadgeNumberAddProduct({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final CartControllerImp _controllerCart = Get.find<CartControllerImp>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (_) {
      return badges.Badge(
          position: badges.BadgePosition.topEnd(top: 0, end: 3),
          badgeAnimation: const badges.BadgeAnimation.fade(
              animationDuration: Duration(microseconds: 300)),
          badgeStyle: const badges.BadgeStyle(),
          badgeContent: Text(
            _controllerCart.quantity().toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: ECustomCardContainerIcon(
            iconColor: ColorsManger.white,
            onPressed: () {
              Get.toNamed(AppRoute.cartScreen);
            },
          ));
    });
  }
}
