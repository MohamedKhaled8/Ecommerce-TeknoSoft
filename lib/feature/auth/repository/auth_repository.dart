import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/ui/on_bording_screen.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instace => Get.find();

  final deviceStorge = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    screenRedirect();
    super.onReady();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.toNamed(AppRoute.buttonBavBar);
      } else {
        Get.toNamed(AppRoute.verifyEmail);
      }
    } else {
      deviceStorge.writeIfNull("IsFirstTime", true);
      deviceStorge.read("IsFirstTime") != true
          ? Get.offAllNamed(AppRoute.loginScreen)
          : Get.offAll(() => const OnBardingScreen());
    }
  }
}
