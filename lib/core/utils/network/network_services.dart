import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce/core/utils/themes/snakBar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworMangerServices extends GetxController {
  static NetworMangerServices get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> __connectionStatus = ConnectivityResult.none.obs;

  @override
  void onReady() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      _updateConnectionStatus;
    });

    super.onReady();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    __connectionStatus.value = result;

    if (__connectionStatus.value == ConnectivityResult.none) {
      snakBar(text: 'No Internet Connection', title: '');
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
