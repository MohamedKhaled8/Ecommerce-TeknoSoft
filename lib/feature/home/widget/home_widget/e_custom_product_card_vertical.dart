import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import '../../../../core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/enums.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/e_shadow.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/home/controller/search_controller.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_icon.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_round_image.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_product_text.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_container.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class ECustomProductCardVertical extends StatelessWidget {
  final int index;
  const ECustomProductCardVertical({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();
    final SearchControllerImp _searchController =
        Get.find<SearchControllerImp>();
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoute.productDetailScreen),
      child: Container(
        height: 170.h,
        padding: EdgeInsets.all(1.r),
        decoration: BoxDecoration(
            boxShadow: [EShadow.verticalProductShadow],
            borderRadius: BorderRadius.circular(ELocalSize.productImageRadius),
            color: EHelperFunction.isDarkMode(context)
                ? ColorsManger.darkGray
                : ColorsManger.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ECustomRoundedContainer(
                padding: const EdgeInsets.all(ELocalSize.sm),
                backgroundColor: EHelperFunction.isDarkMode(context)
                    ? ColorsManger.dark
                    : ColorsManger.ligth,
                height: 145.h,
                child: Stack(
                  children: [
                    GetBuilder<HomeControllerImp>(builder: (_) {
                      return ECustomCircularImage(
                        width: 350.w,
                        height: 150.h,
                        imageUrl: _controller.producteList[index].image,
                        applyImageRadius: true,
                      );
                    }),
                    GetBuilder<SearchControllerImp>(builder: (_) {
                      return Positioned(
                          top: 10.h,
                          child: ECustomRoundedContainer(
                            radius: ELocalSize.sm.h,
                            padding: const EdgeInsets.symmetric(
                                horizontal: ELocalSize.sm,
                                vertical: ELocalSize.xs),
                            backgroundColor:
                                ColorsManger.secoundary.withOpacity(0.8),
                            child: Text(
                              "25",
                              style:
                                  Theme.of(context).textTheme.labelLarge!.apply(
                                        color: ColorsManger.black,
                                      ),
                            ),
                          ));
                    }),
                    // GetBuilder<HomeControllerImp>(builder: (_) {
                    //   return Positioned(
                    //     top: 0.h,
                    //     right: 0.w,
                    //     child: ECustomCircularIcon(
                    //       // onTap: () => _controller.mangeFavorite(
                    //       //   producteListId,
                    //       // ),
                    //       iconData:
                    //           _controller.isFavoriteId(producteListId)
                    //               ? Icons.favorite
                    //               : Icons.favorite_border_outlined,
                    //       color: Colors.red,
                    //     ),
                    //   );
                    // })
                  ],
                ),
              ),
              const SizedBox(
                height: ELocalSize.spaceBtItems / 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: ELocalSize.sm),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const CustomProductTitleText(
                      //   title: "Green Nike",
                      //   smalSize: true,
                      // ),
                      const SizedBox(
                        height: ELocalSize.spaceBtItems / 2,
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     const ECustomBrandTitleWithVIcon(
                      //       title: 'Nike',
                      //       size: TextSizes.larg,
                      //     ),
                      //     Text(
                      //       '256 Products',
                      //       overflow: TextOverflow.ellipsis,
                      //       style: Theme.of(context).textTheme.labelMedium,
                      //     )
                      //   ],
                      // ),
                      GetBuilder<HomeControllerImp>(builder: (_) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ECustomProductPriceText(
                              price: _controller.producteList[index].price
                                  .toString(),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: ColorsManger.dark,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        ELocalSize.cardRadiuseMd),
                                    bottomRight: Radius.circular(
                                        ELocalSize.productImageRadius)),
                              ),
                              child: const SizedBox(
                                width: ELocalSize.iconLg * 1.2,
                                height: ELocalSize.iconLg * 1.2,
                                child: Icon(
                                  Iconsax.add,
                                  color: ColorsManger.white,
                                ),
                              ),
                            )
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



