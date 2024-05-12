import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/themes/show_dialoge.dart';
import 'package:ecommerce/feature/auth/repository/user_repo.dart';
import 'package:ecommerce/feature/auth/repository/user_model.dart';
import 'package:ecommerce/core/utils/network/network_services.dart';
import 'package:ecommerce/feature/auth/verify_code/ui/verifyscreen.dart';
import 'package:ecommerce/feature/auth/register/data/repo/register_repo.dart';
import 'package:ecommerce/feature/auth/verify_code/data/repo/verify_repo.dart';

abstract class SignUpController extends GetxController {
  clearControllers();
  signUp();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController lastNameCont = TextEditingController();
  final TextEditingController firstNameCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();
  final TextEditingController userNamCont = TextEditingController();
  final TextEditingController phoneNumberCont = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool privacePolicy = true;
  bool isshowpassword = true;
  final UserRepo userRepo = Get.put<UserRepo>(UserRepo());

  void togglePrivacyPolicy() {
    privacePolicy = !privacePolicy;
    update();
  }

  @override
  void dispose() {
    emailCont.dispose();
    lastNameCont.dispose();
    firstNameCont.dispose();
    passwordCont.dispose();
    userNamCont.dispose();
    phoneNumberCont.dispose();
    super.dispose();
  }

  @override
  void clearControllers() {
    emailCont.clear();
    lastNameCont.clear();
    firstNameCont.clear();
    passwordCont.clear();
    userNamCont.clear();
    phoneNumberCont.clear();
  }

  @override
  showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  void signUp() async {
    try {
      // Check internet connection
      final isConnected = await NetworMangerServices.instance.isConnected();

      if (!isConnected) {
        Get.snackbar('No Internet', 'Please check your internet connection');
        return;
      }

      if (!formKey.currentState!.validate()) return;

      if (!privacePolicy) {
        Get.snackbar('Accept Privacy Policy',
            'In Order to create account , ypu myst have to read and accept the privacy & Terms of Use');
        return;
      }
      showDialogeAnimations();

      await Future.delayed(const Duration(seconds: 7));

      Navigator.of(Get.overlayContext!).pop();

      final userCredential = await RegisterRepo.instance
          .registerWithEmailAndPassword(
              emailCont.text.trim(), passwordCont.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          username: userNamCont.text.trim(),
          email: emailCont.text.trim(),
          phoneNumber: phoneNumberCont.text.trim(),
          password: passwordCont.text.trim(),
          profilePic: "",
          firstName: firstNameCont.text.trim(),
          lastName: lastNameCont.text.trim());

      await userRepo.saveUserRecord(newUser);

      await VerifyRepo.instance.sendEmailVerification();
      Get.snackbar(
        'Congratulations',
        'Your account has been created! Verify email to continue',
      );
      Get.offAll(() => VerifyEmailScreen(
            email: emailCont.text.trim(),
          ));
      Future.delayed(const Duration(milliseconds: 500), () {
        clearControllers();
      });
    } catch (e) {
      Get.snackbar(
        'oh Snap!',
        e.toString(),
      );
    }
  }
}
