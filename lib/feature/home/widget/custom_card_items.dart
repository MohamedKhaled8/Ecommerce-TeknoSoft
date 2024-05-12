import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/product_screen/ui/product_screen.dart';
import 'package:ecommerce/feature/favorite_screen/controller/favorite_controller.dart';
import 'package:ecommerce/feature/home/widget/e_custom_card_items.dart/build_card_items.dart';

class CustomCardItems extends StatelessWidget {
  const CustomCardItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();
    final FavoriteControllerImp _controllerFav =
        Get.find<FavoriteControllerImp>();

    return GetBuilder<HomeControllerImp>(
      builder: (_) {
        if (_controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManger.blue,
            ),
          );
        } else {
          return SizedBox(
            height: 300.h,
            width: double.infinity,
            child: _controller.searchList.isEmpty &&
                    _controller.searchTextCont.text.isNotEmpty
                ? Get.isDarkMode
                    ? Image.asset("assets/images/search_empty_dark.png")
                    : Image.asset("assets/images/search_empry_light.png")
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 9.0,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final productModel = _controller.searchList.isEmpty
                          ? _controller.producteList[index]
                          : _controller.searchList[index];
                      return BuildCardItems(
                        image: productModel.image,
                        price: productModel.price,
                        rate: productModel.rating.rate,
                        producteListId: productModel.id,
                        productModel: productModel,
                        onTap: () {
                          Get.to(() => ProductDetailsScreen(
                              productModels: productModel));
                        },
                        index: index,
                      );
                    },
                    itemCount: _controller.searchList.isEmpty
                        ? _controller.producteList.length
                        : _controller.searchList.length,
                  ),
          );
        }
      },
    );
  }
}
