import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/feature/auth/verify_code/data/repo/verify_repo.dart';

abstract class VerifyController extends GetxController {
  sendEmailVerification();
  setTimerForAuthRedirect();
  checkEmailVerifyStatus();
}

class VerifyControllerImp extends VerifyController {
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAuthRedirect();
  }

  @override
  void sendEmailVerification() async {
    try {
      await VerifyRepo.instance.sendEmailVerification();
      Get.snackbar(
        "Email Sent",
        "Please check your inbox to verify your email",
      );
    } catch (e) {
      return ;
    }
  }

  @override
  void setTimerForAuthRedirect() {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        if (Get.isOverlaysOpen) {
          Get.back();
        }
        Get.offAllNamed(AppRoute.loginScreen);
      }
    });
  }

  @override
  checkEmailVerifyStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.offAllNamed(AppRoute.loginScreen);
    }
  }
}
