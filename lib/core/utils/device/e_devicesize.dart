import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EDeviceSize {
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHigth() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
}
