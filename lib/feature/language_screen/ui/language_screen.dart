import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';
import 'package:ecommerce/feature/language_screen/widgets/custom_top_screen.dart';
import 'package:ecommerce/feature/language_screen/widgets/custom_grid_choose_language.dart';

class LanguageScreen extends StatelessWidget {
  final bool? isSelected;
  const LanguageScreen({
    Key? key,
    this.isSelected = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h),
        child: Column(
          children: [
            const CustomTopLangScreen(),
            const Expanded(child: CustomGridChooseLanguage()),
            isSelected == true
                ? CustomButtonLocal(
                    onTap: () {
                      Get.offAllNamed(AppRoute.buttonBavBar);
                    },
                    text: "Containue".tr,
                    height: 50,
                    width: 320,
                    customTextColor: ColorsManger.white,
                    color: ColorsManger.primary,
                    isBorder: false,
                  )
                : CustomButtonLocal(
                    onTap: () {
                      Get.back();
                    },
                    text: "Back".tr,
                    height: 50,
                    width: 320,
                    color: ColorsManger.white,
                    customTextColor: ColorsManger.primary,
                    isBorder: false,
                  )
          ],
        ),
      ),
    );
  }
}
