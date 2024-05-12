import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/utils/error/handel_error.dart';

class VerifyRepo extends GetxController {
  final auth = FirebaseAuth.instance;
  static VerifyRepo get instance => Get.find();

  Future<void> sendEmailVerification() async {
    try {
      await auth.currentUser?.sendEmailVerification();
    } catch (e) {
     handleError(e);
      throw 'something wentwring please try again, ';
    }
  }
}
