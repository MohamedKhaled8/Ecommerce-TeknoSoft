import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

abstract class ProductController extends GetxController {
  void onPageChangedColors(int index);
  void onPageChangedDetailes(int index);
  void changeColorButtom(int index);
}

class ProductControllerImp extends ProductController {
  int currentPage = 0;
  int currentColor = 0;
  int currentIndexx = 0;
  @override
  void onPageChangedDetailes(int index) {
    currentPage = index;
    update();
  }

  @override
  void onPageChangedColors(int index) {
    currentColor = index;
    update();
  }

  @override
  void changeColorButtom(int index) {
    currentIndexx = index;
    update();
  }
    final List<Color> colorSelected = [
    ColorsManger.kCOlor1,
    ColorsManger.kCOlor2,
    ColorsManger.kCOlor3,
    ColorsManger.kCOlor4,
    ColorsManger.kCOlor5,
    ColorsManger.kCOlor2,
    ColorsManger.kCOlor3,
    ColorsManger.kCOlor4,
  ];
   final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
}
