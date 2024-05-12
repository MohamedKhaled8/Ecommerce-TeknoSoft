import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/core/utils/network/network_services.dart';
import 'package:ecommerce/feature/auth/forget_password/repo/forget_repo.dart';

abstract class ForgetPasswordController extends GetxController {
  clearControllers();
  resetPassword();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  clearControllers() {
    emailController.clear();
  }

  @override
  void resetPassword() async {
    try {
      final isConnected = await NetworMangerServices.instance.isConnected();

      if (!isConnected) {
        Get.snackbar('No Internet', 'Please check your internet connection');
        return;
      }
      if (formKey.currentState != null && !formKey.currentState!.validate()) {
        return;
      }
      await ForgetRepo.instance
          .resetPassword(email: emailController.text.trim());
      Get.snackbar(
        'Congratulations',
        'Your account has been created! Verify email to continue',
      );
      Get.offAllNamed(AppRoute.loginScreen);
      Future.delayed(const Duration(milliseconds: 500), () {
        clearControllers();
      });
    } catch (e) {
      Get.snackbar(
        'oh Snap!',
        e.toString(),
      );
      debugPrint(
        e.toString(),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }
}
