import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/utils/error/handel_error.dart';

class RegisterRepo extends GetxController {
  final auth = FirebaseAuth.instance;
  static RegisterRepo get instance => Get.find();

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }catch (e) {
     handleError(e);
      throw 'something wentwring please try again, ';
    }
  }
}
