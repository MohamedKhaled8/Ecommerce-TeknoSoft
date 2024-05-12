import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/feature/cart/ui/sucess_payment.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/cart/data/repo/payment_repo.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';
import 'package:ecommerce/feature/cart/controller/cart_controller.dart';
import 'package:ecommerce/feature/cart/widgets/e_custom_cart_product_card.dart';

class ECustomShowAddCart extends StatelessWidget {
  const ECustomShowAddCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartControllerImp _controller = Get.find<CartControllerImp>();

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ELocalSize.defaultSpace.r),
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    ELocalSize.defaultSpace.h * 8 -
                    45.h,
                child: GetBuilder<CartControllerImp>(
                  builder: (_) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        if (index < _controller.productsMap.length) {
                          return CartProductCard(
                            productModel:
                                _controller.productsMap.keys.toList()[index],
                            index: index,
                            quantity:
                                _controller.productsMap.values.toList()[index],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15.h);
                      },
                      itemCount: _controller.productsMap.length,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        GetBuilder<CartControllerImp>(builder: (_) {
          return CustomButtonLocal(
            width: 320.w,
            height: 45.h,
            color: ColorsManger.primary,
            customTextColor: ColorsManger.white,
            isBorder: false,
            text:
                'Checkout \$${_controller.getTotal}', 
            onTap: () async {
              // Making payment
              await PaymentManager.makePayment(_controller.getTotal, "USD");

              Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => const SuccessPaymentScreen()));
            },
          );
        }),
      ],
    );
  }
}
