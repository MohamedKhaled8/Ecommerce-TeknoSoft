import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class EDeviceUtiles {
  static void hideKeybord(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatuseBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;

    return viewInsets.bottom == 0;
  }

  static bool isPortaitOrintaion(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;

    return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getScreenHigth() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double getPixelRation() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double setStatuseBarHigth() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getBottomNavBarHigth() {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHigth() {
    return kToolbarHeight;
  }

  static getKeyboardHeigth() {
    final viewInsets = View.of(Get.context!).viewInsets;

    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;

    return viewInsets.bottom > 0;
  }

  static Future<bool> isPhysicolDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferredDientotions(
      List<DeviceOrientation> orientations) async {
    return SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');

      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // static void lanunchUrl(String url) async {
  //   if (await canLaunchUrlString(url)) {
  //     await canLaunchUrlString(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
