import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountDeletionRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> deleteAccount(String email, String password) async {
    try {
      // Sign in with email and password to authenticate the user
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      
      // Get the current user
      User? user = _auth.currentUser;

      if (user != null) {
        // Delete the user's account
        await user.delete();
      }
    } catch (e) {
      // Handle errors
      Get.snackbar('Error', 'Failed to delete account: $e');
      throw e;
    }
  }
}
