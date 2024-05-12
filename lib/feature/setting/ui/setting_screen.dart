import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/core/utils/themes/e_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/setting/controller/update_name_controller.dart';
import 'package:ecommerce/feature/setting/widgets/setting_widgets/e_custom_profile_tile.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_primary_header_container.dart';
import 'package:ecommerce/feature/setting/widgets/setting_widgets/e_custom_feature_setting_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<UpdateNameController>(UpdateNameController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomEPrimaryHeaderContainer(
                height: 200.h,
                child: Column(
                  children: [
                    EAppBar(
                      title: Text(
                        'Account'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: ColorsManger.white),
                      ),
                    ),
                    ECustomProfileTile(
                      onTap: () => Get.toNamed(AppRoute.profileScreen),
                    ),
                    const SizedBox(
                      height: ELocalSize.spaceBetweenSection,
                    ),
                  ],
                )),
            const ECustomFeatureSettingScreen()
          ],
        ),
      ),
    );
  }
}

