import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/utils/error/handel_error.dart';

class ForgetRepo extends GetxController {
  final auth = FirebaseAuth.instance;
  static ForgetRepo get instance => Get.find();

  Future<void> resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      handleError(e);
      throw 'something wentwring please try again, ';
    }
  }
}
