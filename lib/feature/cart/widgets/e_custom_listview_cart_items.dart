import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/feature/cart/widgets/e_custom_cart_item.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_product_text.dart';
import 'package:ecommerce/feature/cart/widgets/e_custom_product_add_and_remove_and_more_quantity_button.dart';

class ECustomListViewCartItems extends StatelessWidget {
  final bool showAddRemoveButton;
  const ECustomListViewCartItems({
    Key? key,
    this.showAddRemoveButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const ECustomCartItem(),
            if (showAddRemoveButton)
              SizedBox(
                height: ELocalSize.spaceBtItems.h,
              ),
            if (showAddRemoveButton)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 80.w,
                      ),
                      const ECustomProductAddAndRemoveAndMoreQuantityButton(),
                    ],
                  ),
                  const ECustomProductPriceText(price: '256')
                ],
              ),
          ],
        );
      },
      itemCount: 2,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: ELocalSize.spaceBetweenSection.h,
      ),
    );
  }
}
