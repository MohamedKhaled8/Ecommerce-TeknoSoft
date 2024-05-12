import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/core/utils/themes/e_appbar.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/favorite_screen/widgets/e_custom_show_fav.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_icon.dart';
import 'package:ecommerce/feature/favorite_screen/widgets/e_custom_is_empty_fav.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _homeControllerImp =
        Get.put<HomeControllerImp>(HomeControllerImp());

    return Scaffold(
        appBar: EAppBar(
          title: Text(
            "Favorite".tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            ECustomCircularIcon(
              iconData: Iconsax.favorite_chart,
              onTap: () => Get.toNamed(AppRoute.homeScreen),
            ),
          ],
        ),
        body: GetBuilder<HomeControllerImp>(
          builder: (_) {
            if (_homeControllerImp.favoriteList.isEmpty) {
              return const ECustomIsEmptyFav();
            } else {
              return const ECsutomShowFav();
            }
          },
        ));
  }
}
