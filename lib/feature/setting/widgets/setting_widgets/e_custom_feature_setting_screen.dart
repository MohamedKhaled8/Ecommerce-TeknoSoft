import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/feature/maps/ui/maps_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/feature/notifications/notifications_screen.dart';
import 'package:ecommerce/feature/delete_account/delete_account_screen.dart';
import 'package:ecommerce/feature/setting/controller/update_name_controller.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_section_heading.dart';
import 'package:ecommerce/feature/setting/widgets/setting_widgets/e_custom_setting_menu_tile.dart';

class ECustomFeatureSettingScreen extends StatelessWidget {
  const ECustomFeatureSettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UpdateNameController controller = Get.find<UpdateNameController>();

    return Padding(
      padding: EdgeInsets.all(ELocalSize.defaultSpace.r),
      child: Column(children: [
        ECustomSectionHeading(
          title: "Account Setting".tr,
          showActionButton: false,
        ),
        SizedBox(
          height: ELocalSize.spaceBtItems.h,
        ),
        ECustomSettingMenuTile(
          iconData: Iconsax.safe_home,
          onTap: () => Get.toNamed(AppRoute.userAddressScreen),
          title: 'My Account'.tr,
          subTitle: 'Set Shopping delivery address'.tr,
        ),
        ECustomSettingMenuTile(
          onTap: () => Get.toNamed(AppRoute.cartScreen),
          iconData: Iconsax.shopping_cart,
          title: 'My Cart'.tr,
          subTitle: 'Add and Remove Products and move to checkout'.tr,
        ),
        ECustomSettingMenuTile(
          iconData: Iconsax.profile_delete,
          onTap: () => Get.to(() => DeleteAccount()),
          title: "Deleate Account".tr,
          subTitle: 'Deleate Account User'.tr,
        ),
        ECustomSettingMenuTile(
          iconData: Iconsax.notification,
          title: 'Notification'.tr,
          onTap: () => Get.to(() => const NotificationsScreen()),
          subTitle: 'Notification Message'.tr,
        ),
        GetBuilder<UpdateNameController>(builder: (_) {
          return ECustomSettingMenuTile(
            iconData: Iconsax.logout,
            title: 'LogOUt'.tr,
            onTap: () {
              controller.logout();
            },
            subTitle: 'LogOut Your Application'.tr,
          );
        }),
        SizedBox(
          height: ELocalSize.spaceBetweenSection.h,
        ),
        ECustomSectionHeading(
          title: "App Setting".tr,
          showActionButton: false,
        ),
        SizedBox(
          height: ELocalSize.spaceBtItems.h,
        ),
        ECustomSettingMenuTile(
          iconData: Iconsax.document_upload,
          title: 'Maps Tracking'.tr,
          subTitle: 'Traking Product'.tr,
          onTap: () => Get.to(() => const GoogleMapScreen()),
        ),
        SizedBox(
          height: ELocalSize.spaceBtItems.h,
        ),
        ECustomSettingMenuTile(
          iconData: Iconsax.language_square,
          title: 'Translate'.tr,
          subTitle: 'Translate Your App'.tr,
          onTap: () => Get.toNamed(AppRoute.languageScreen),
        ),
      ]),
    );
  }
}
