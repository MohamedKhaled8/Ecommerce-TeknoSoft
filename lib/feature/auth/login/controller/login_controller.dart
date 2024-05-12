import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/network/network_services.dart';
import 'package:ecommerce/feature/auth/repository/auth_repository.dart';
import 'package:ecommerce/feature/auth/login/data/repo/login_repo.dart';
import 'package:ecommerce/feature/auth/login/controller/user_controller.dart';

abstract class LoginController extends GetxController {
  togglePrivacyPolicy();
  showPassword();
  loginUser();
  googleSignIn();
  clearControllers();
}

class LoginControllerImp extends LoginController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isShowPassword = true;
  bool privacyPolicy = true;
  bool rememberMe = false;

  final storage = GetStorage();
  final UserController userController =
      Get.put<UserController>(UserController());
  @override
  void onInit() {
    emailController.text = storage.read("REMEMBER_ME_EMAIL") ?? '';
    passwordController.text = storage.read("REMEMBER_ME_PASSWORD") ?? '';
    super.onInit();
  }

  @override
  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void togglePrivacyPolicy() {
    rememberMe = !rememberMe;
    update();
  }

  @override
  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  Future<void> loginUser() async {
    try {
      Lottie.asset(
        'assets/json/finish.json',
        width: 200.w,
        height: 200.h,
        fit: BoxFit.fill,
      );
      final isConnected = await NetworMangerServices.instance.isConnected();

      if (!isConnected) {
        Get.snackbar('No Internet', 'Please check your internet connection');
        return;
      }

      if (rememberMe) {
        storage.write("REMEMBER_ME_EMAIL", emailController.text.trim());
        storage.write("REMEMBER_ME_PASSWORD", passwordController.text.trim());
      }

      if (formKey.currentState!.validate()) {
        await LoginRepo.instance.loginEmailAndPassword(
            emailController.text.trim(), passwordController.text.trim());
        AuthRepository.instace.screenRedirect();
      }
      Future.delayed(const Duration(milliseconds: 500), () {
        clearControllers();
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  Future<void> googleSignIn() async {
    try {
      final isConnected = await NetworMangerServices.instance.isConnected();

      if (!isConnected) {
        Get.snackbar('No Internet', 'Please check your internet connection');
        return;
      }
      final userCredential = await LoginRepo.instance.signInWithGoogle();

      await userController.saveUserRecod(
          userCredential, passwordController.text);

      AuthRepository.instace.screenRedirect();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
