import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_local.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';
import 'package:ecommerce/feature/cart/controller/cart_controller.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/favorite_screen/controller/favorite_controller.dart';

// ignore: must_be_immutable
class BuildCardItems extends StatelessWidget {
  final String image;
  final double price;
  final double rate;
  final int producteListId;
  ProductModel productModel;
  final Function()? onTap;
  final int index;
  BuildCardItems({
    Key? key,
    required this.image,
    required this.price,
    required this.rate,
    required this.producteListId,
    required this.productModel,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();
    final FavoriteControllerImp _controllerFav =
        Get.find<FavoriteControllerImp>();
    final CartControllerImp _controllerCart = Get.find<CartControllerImp>();
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 7.w, right: 7.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<HomeControllerImp>(builder: (_) {
                    return IconButton(
                        onPressed: () {
                          _controller.mangeFavorite(producteListId);
                        },
                        icon: _controller.isFavoriteId(producteListId)
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.black,
                              ));
                  }),
                  GetBuilder<CartControllerImp>(
                    builder: (_) {
                      final isInCart =
                          _controllerCart.isProductInCart(productModel);
                      return IconButton(
                        onPressed: () {
                          _controllerCart.handleProductAction(
                            productModel,
                            context,
                            isInCart ? 1 : 0,
                          );
                          if (isInCart) {
                            _controllerCart.removeProductFromCard(productModel);
                          } else {
                            _controllerCart.addProductToCard(productModel);
                          }
                        },
                        icon: isInCart
                            ? const Icon(Iconsax.shop_remove,
                                color: ColorsManger.red)
                            : const Icon(Iconsax.shop_add,
                                color: ColorsManger.black),
                      );
                    },
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextLocal(
                        text: "\$ $price",
                        color: ColorsManger.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        underLine: TextDecoration.none),
                    Container(
                      height: 25.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: ColorsManger.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5).w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextLocal(
                                text: "$rate",
                                color: Get.isDarkMode
                                    ? ColorsManger.white
                                    : ColorsManger.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                underLine: TextDecoration.none),
                            Icon(
                              Icons.star,
                              size: 16.h,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
