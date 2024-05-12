import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/themes/e_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_form_field.dart';
import 'package:ecommerce/feature/setting/controller/update_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpdateNameController>();
    return Scaffold(
      appBar: EAppBar(
        showBackArrowButton: true,
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(ELocalSize.defaultSpace.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Change Tour Name",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(fontSizeDelta: 12.sp),
            ),
            SizedBox(
              height: ELocalSize.spaceBetweenSection.h,
            ),
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: controller.firstName,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a valid First Name";
                      }
                      return null;
                    },
                    isNumber: false,
                    iconData: Iconsax.direct_right,
                    labelText: 'First Name',
                    isSuffixIcon: false,
                    expands: false,
                  ),
                  SizedBox(
                    height: ELocalSize.spaceBtweenInputFildes.h,
                  ),
                  CustomTextFormField(
                    controller: controller.lastName,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a valid Last Name";
                      }
                      return null;
                    },
                    isNumber: false,
                    iconData: Iconsax.direct_right,
                    labelText: 'Last Name',
                    isSuffixIcon: false,
                    expands: false,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ELocalSize.spaceBetweenSection.h,
            ),
            GetBuilder<UpdateNameController>(builder: (_) {
              return SizedBox(
                width: double.infinity,
                child: CustomButtonLocal(
                  width: 320.w,
                  height: 45.h,
                  color: ColorsManger.primary,
                  isBorder: false,
                  text: "Save",
                  onTap: () => controller.updateUserName(),
                  customTextColor: ColorsManger.white,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
