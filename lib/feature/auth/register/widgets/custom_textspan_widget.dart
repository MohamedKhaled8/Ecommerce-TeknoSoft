import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';

class CustomTextSpanWidget extends StatelessWidget {
  const CustomTextSpanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);

    return Text.rich(TextSpan(
      children: [
        TextSpan(
            text: 'isAgreeTo'.tr, style: Theme.of(context).textTheme.bodySmall),
        TextSpan(
            text: 'privacePolicy'.tr,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? ColorsManger.white : ColorsManger.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      dark ? ColorsManger.white : ColorsManger.primary,
                )),
        TextSpan(text: 'and'.tr, style: Theme.of(context).textTheme.bodySmall),
        TextSpan(
          text: 'ternsOfUse'.tr,
          style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? ColorsManger.white : ColorsManger.primary,
                decoration: TextDecoration.underline,
                decorationColor:
                    dark ? ColorsManger.white : ColorsManger.primary,
              ),
        )
      ],
    ));
  }
}
