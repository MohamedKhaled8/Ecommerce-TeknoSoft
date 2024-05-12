import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/feature/home/widget/custom_card_items.dart';
import 'package:ecommerce/feature/cart/controller/cart_controller.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/home/controller/search_controller.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_promo_slider.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_home_app_bar.dart';
import 'package:ecommerce/feature/favorite_screen/controller/favorite_controller.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_section_heading.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_search_homescreen.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_primary_header_container.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_first_welcome_person_animate.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_secound_welcome_person_animate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller =
        Get.put<HomeControllerImp>(HomeControllerImp());
    final SearchControllerImp _controllerImp =
        Get.put<SearchControllerImp>(SearchControllerImp());
    final FavoriteControllerImp _controllerFav =
        Get.put<FavoriteControllerImp>(FavoriteControllerImp());
    final CartControllerImp _controllerCart =
        Get.put<CartControllerImp>(CartControllerImp());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomEPrimaryHeaderContainer(
              height: 280.h,
              child: Column(
                children: [
                  const ECustomHomeAppBAr(),
                  SizedBox(
                    height: ELocalSize.spaceBetweenSection.h,
                  ),
                  ECustomSearchHomeScreenWidget(
                    text: 'Search in The Store'.tr,
                    icon: Iconsax.search_favorite,
                  ),
                  SizedBox(
                    height: ELocalSize.spaceBetweenSection.h,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: ELocalSize.defaultSpace.w,
                      ),
                      child: GetBuilder<HomeControllerImp>(
                        builder: (_) {
                          return Column(
                            children: [
                              
                              if (_controller.showFirstWidget)
                                const CustomFirstWelomePersonAnimate(),
                              if (!_controller.showFirstWidget)
                                const CustomScoundWelcomePerosnAnimate(),
                            ],
                          );
                        },
                      ))
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(ELocalSize.defaultSpace.r),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const ECustomPromoSlider(),
                  SizedBox(
                    height: ELocalSize.spaceBetweenSection.h,
                  ),
                  ECustomSectionHeading(
                    title: 'Popular Products'.tr,
                    onPressed: () => Get.toNamed(AppRoute.allProductScreen),
                  ),
                  SizedBox(
                    height: ELocalSize.spaceBetweenSection.h,
                  ),
                  const CustomCardItems(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
