import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ecommerce/core/Router/routes.dart';

abstract class OnBardingController extends GetxController {
  updatePageIndicator(int index);
  dottiedNavClick(index);
  skipPage();
  nextPage();
}

class OnBardingControllerImp extends OnBardingController {
  final pageController = PageController();

  int currentIndex = 0;

  final storge = GetStorage();

  @override
  void updatePageIndicator(int index) => currentIndex = index;

  @override
  void dottiedNavClick(index) {
    currentIndex = index;
    pageController.jumpTo(index);
    update();
  }

  @override
  void skipPage() {
    currentIndex = 2;
    pageController.jumpToPage(2);
    update();
  }

  @override
  void nextPage() {
    if (currentIndex == 2) {
      storge.write("IsFirstTime", false);
      Get.offAllNamed(AppRoute.loginScreen);
    } else {
      int page = currentIndex + 1;
      pageController.jumpToPage(page);
    }
    update();
  }
}
