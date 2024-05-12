import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext scaffoldContext) {
          final dark = EHelperFunction.isDarkMode(scaffoldContext);

          final BottomNavBarItem controller =
              Get.put<BottomNavBarItem>(BottomNavBarItem());

          return Scaffold(
            bottomNavigationBar: GetBuilder<BottomNavBarItem>(
              builder: (_) {
                return NavigationBar(
                  height: 65.h,
                  elevation: 0.0,
                  selectedIndex: controller.selectedIndex,
                  backgroundColor:
                      dark ? ColorsManger.black : ColorsManger.white,
                  indicatorColor: dark
                      ? ColorsManger.white.withOpacity(0.1)
                      : ColorsManger.black.withOpacity(0.1),
                  onDestinationSelected: (index) {
                    controller.selectedIndex = index;
                    controller.update();
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Iconsax.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Iconsax.shop),
                      label: 'Store',
                    ),
                    NavigationDestination(
                      icon: Icon(Iconsax.heart),
                      label: 'Favorite',
                    ),
                    NavigationDestination(
                      icon: Icon(Iconsax.user),
                      label: 'Profile',
                    ),
                  ],
                );
              },
            ),
            body: GetBuilder<BottomNavBarItem>(
              builder: (_) {
                return controller.screen[controller.selectedIndex];
              },
            ),
          );
        },
      ),
    );
  }
}
