import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/product_screen/controller/product_controller.dart';
import 'package:ecommerce/feature/home/widget/e_custom_card_items.dart/custom_add_card.dart';
import 'package:ecommerce/feature/home/widget/e_custom_card_items.dart/custom_sized_closes.dart';
import 'package:ecommerce/feature/home/widget/e_custom_card_items.dart/e_custom_image_slider.dart';
import 'package:ecommerce/feature/home/widget/e_custom_card_items.dart/e_custom_closes_info_detailes.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModels;

  const ProductDetailsScreen({
    Key? key,
    required this.productModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductControllerImp _controller = Get.put<ProductControllerImp>(ProductControllerImp());
    final HomeControllerImp _homeControllerImp = Get.put<HomeControllerImp>(HomeControllerImp());

    return SafeArea(
      child: Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<ProductControllerImp>(builder: (_) {
                return ECustomImageSlidler(
                  imageUrl: productModels.image,
                );
              }),
              ECUstomClosesInfoDetailes(
                rate: productModels.rating.rate,
                descripthion: productModels.description,
                producteListId: productModels.id,
                title: productModels.title,
                productModels: productModels,
              ),
              const CustomSizedCloses(),
              CustomAddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
