import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_section_heading.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_container.dart';
import 'package:ecommerce/feature/product_screen/widgets/product_review_widget/e_custom_chice_ship.dart';
import 'package:ecommerce/feature/product_screen/widgets/product_review_widget/e_custom_product_title_text.dart';

class ECustomProductAttributes extends StatelessWidget {
  const ECustomProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);

    return Column(
      children: [
        ECustomRoundedContainer(
          padding: const EdgeInsets.all(ELocalSize.md),
          backgroundColor: dark ? ColorsManger.darkGray : ColorsManger.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const ECustomSectionHeading(
                    title: "Variation",
                    showActionButton: F,
                  ),
                  const SizedBox(
                    width: ELocalSize.spaceBtItems,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const ECustomProductTitleText(
                            title: 'Price',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: ELocalSize.spaceBtItems,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: ELocalSize.spaceBtItems,
                          ),
                          const ECustomProductTitleText(
                            title: '20',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const ECustomProductTitleText(
                            title: 'Stack : ',
                            smallSize: true,
                          ),
                          Text('in Stack',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const ECustomProductTitleText(
                title:
                    'This is Desrtiption of the Product and it can go up to max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: ELocalSize.spaceBtItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ECustomSectionHeading(
              title: "Colors",
              showActionButton: false,
            ),
            const SizedBox(
              height: ELocalSize.spaceBtItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                ECustomChiceShip(
                  text: "Green",
                  isSelected: true,
                  onTap: (value) {},
                ),
                ECustomChiceShip(
                  text: "Blue",
                  isSelected: false,
                  onTap: (value) {},
                ),
                ECustomChiceShip(
                  text: "Red",
                  isSelected: false,
                  onTap: (value) {},
                ),
                ECustomChiceShip(
                  text: "Yellow",
                  isSelected: false,
                  onTap: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ECustomSectionHeading(
              title: "Size",
              showActionButton: false,
            ),
            const SizedBox(
              height: ELocalSize.spaceBtItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                ECustomChiceShip(
                  text: "EU 34",
                  isSelected: true,
                  onTap: (value) {},
                ),
                ECustomChiceShip(
                  text: "EU 36",
                  isSelected: false,
                  onTap: (value) {},
                ),
                ECustomChiceShip(
                  text: "EU 38",
                  isSelected: false,
                  onTap: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
