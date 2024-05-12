import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/feature/auth/repository/user_repo.dart';
import 'package:ecommerce/feature/auth/login/ui/login_screen.dart';
import 'package:ecommerce/core/utils/network/network_services.dart';
import 'package:ecommerce/feature/auth/login/controller/user_controller.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final UserController userController = UserController.instance;
  final userRepo = Get.put<UserRepo>(UserRepo());

  final GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  Future<void> initializeNames() async {
    firstName.text = userController.user.firstName;
    lastName.text = userController.user.lastName;
  }

  Future<void> updateUserName() async {
    try {
      final isConnected = await NetworMangerServices.instance.isConnected();

      if (!isConnected) {
        Get.snackbar('No Internet', 'Please check your internet connection');
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        return;
      }

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };

      await userRepo.updateSingleField(name);

      userController.user.firstName = firstName.text.trim();
      userController.user.lastName = lastName.text.trim();

      Get.snackbar('Congratulations,', 'Your Name has been Update');

      Get.offAll(() => AppRoute.profileScreen);
    } catch (e) {
      Get.snackbar('Oh Snap!', e.toString());
      debugPrint('error: $e');
    }

    update();
  }

  @override
  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(const LoginScreen());
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }
}
