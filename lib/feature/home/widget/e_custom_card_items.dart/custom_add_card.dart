import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_local.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';
import 'package:ecommerce/feature/cart/controller/cart_controller.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';

class CustomAddCart extends StatelessWidget {
  final double price;
  final ProductModel productModels;
  const CustomAddCart({
    required this.price,
    required this.productModels,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();
    final CartControllerImp _controllerCart = Get.find<CartControllerImp>();

    return Container(
      padding: const EdgeInsets.all(25).r,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextLocal(
                  text: "Price",
                  color: ColorsManger.blue,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
              Text(
                "\$$price",
                style: TextStyle(
                  color: ColorsManger.blue,
                  fontSize: 20.h,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          GetBuilder<CartControllerImp>(builder: (_) {
            return Expanded(
              child: SizedBox(
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    primary: ColorsManger.blue,
                  ),
                  onPressed: () {
                    _controllerCart.addProductToCard(productModels);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextLocal(
                        text: "Add to Cart",
                        color: Colors.white,
                        fontSize: 18.h,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
