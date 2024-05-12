import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_local.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';
import 'package:ecommerce/feature/cart/controller/cart_controller.dart';

// ignore: must_be_immutable
class CartProductCard extends StatelessWidget {
  ProductModel productModel;
  final int index;
  final int quantity;
  CartProductCard({
    Key? key,
    required this.productModel,
    required this.index,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartControllerImp _controller = Get.find<CartControllerImp>();
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
      height: 110.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: EHelperFunction.isDarkMode(context)
            ? ColorsManger.white
            : ColorsManger.blue.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Radio(
            value: "",
            groupValue: "",
            onChanged: (val) {},
            activeColor: ColorsManger.blue,
          ),
          Container(
            height: 100.h,
            width: 70.h,
            margin: const EdgeInsets.only(left: 15, top: 2).w,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                      productModel.image,
                    ),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextLocal(
                      text: productModel.title,
                      color: Colors.black,
                      fontSize: 16.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.normal),
                  CustomTextLocal(
                    text: _controller.subTotal.length > index
                        ? "\$ ${_controller.subTotal[index].toStringAsFixed(2)}"
                        : "\$ 0.00",
                    color: Colors.black,
                    fontSize: 16.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              )),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30).r,
                child: IconButton(
                  onPressed: () {
                    _controller.removeProductFromCard(productModel);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                        )
                      ],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        _controller.removeOneProductFromCard(productModel);
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomTextLocal(
                    text: "$quantity",
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 30.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                        )
                      ],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        _controller.addProductToCard(productModel);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
