import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecommerce/core/utils/error/handel_error.dart';

class LoginRepo extends GetxController {
  final _auth = FirebaseAuth.instance;
  static LoginRepo get instance => Get.find();

  Future<void> loginEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      handleError(e);
      throw 'something wentwring please try again, ';
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credential);
    } catch (e) {
     handleError(e);
      throw 'something wentwring please try again, ';
    }
  }

  Future<void> logOut() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAllNamed(AppRoute.loginScreen);
    } catch (e) {
     handleError(e);
      throw 'something wentwring please try again, ';
    }
  }
}
