import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_search_homescreen.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_notification_home_screen_widget.dart';


class CustomHeaderHomeScreenWidget extends StatelessWidget {
  const CustomHeaderHomeScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ECustomSearchHomeScreenWidget(
          icon: Iconsax.search_normal,
          text: "Search in Story",
        ),
        Spacer(),
        CustomNotificationHomeScreenWiget(),
      ],
    );
  }
}
