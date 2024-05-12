import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/themes/e_appbar.dart';
import 'package:ecommerce/feature/cart/controller/cart_controller.dart';
import 'package:ecommerce/feature/cart/widgets/e_custom_empty_cart.dart';
import 'package:ecommerce/feature/cart/widgets/e_custom_show_add_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartControllerImp _controller =
        Get.put<CartControllerImp>(CartControllerImp());
    return Scaffold(
      appBar: EAppBar(
        showBackArrowButton: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        action: [
          GetBuilder<CartControllerImp>(builder: (_) {
            return IconButton(
              onPressed: () {
                _controller.clearAllProductToCard(context);
              },
              icon: const Icon(Icons.backspace),
            );
          })
        ],
      ),
      body: GetBuilder<CartControllerImp>(
        builder: (_) {
          if (_controller.productsMap.isEmpty) {
            return const CustomEmptyCart();
          } else {
            return const ECustomShowAddCart();
          }
        },
      ),
    );
  }
}
