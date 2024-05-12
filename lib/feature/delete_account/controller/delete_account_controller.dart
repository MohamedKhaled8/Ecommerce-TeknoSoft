import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/validation/app_regex.dart';
import 'package:ecommerce/feature/delete_account/repo/account_delete_repo.dart';

class AccountDeletionController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isShowPassword = true;

  final AccountDeletionRepo _repo = AccountDeletionRepo();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  Future<void> deleteAccount() async {
    try {
      if (formKey.currentState!.validate()) {
        // Call the repository method to delete account
        await _repo.deleteAccount(emailController.text.trim(), passwordController.text.trim());
        // Handle successful account deletion (e.g., show success message, navigate to another screen)
      }
    } catch (e) {
      // Handle errors (e.g., show error message)
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
