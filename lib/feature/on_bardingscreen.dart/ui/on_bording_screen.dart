import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/controller/on_barding_controller.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/widgets/custom_onbarding_skip_widget.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/widgets/custom_page_view_builder_widget.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/widgets/custom_next_button_onbarding_widget.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/widgets/custom_smooth_indicator_navigation_widget.dart';

class OnBardingScreen extends StatelessWidget {
  const OnBardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBardingControllerImp controller =
        Get.put<OnBardingControllerImp>(OnBardingControllerImp());
    return const Scaffold(
      body: Stack(
        children: [
          CustomPageViewBuilderWidget(),
          CustomOnBardingSkipWidget(),
          CustomSmoothIndicatorNavigationWidget(),
          CustomNetButtonOnBardingWidget(),
        ],
      ),
    );
  }
}
