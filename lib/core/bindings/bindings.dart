import 'package:get/get.dart';
import 'package:ecommerce/feature/cart/controller/cart_controller.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/home/controller/search_controller.dart';
import 'package:ecommerce/feature/auth/login/controller/login_controller.dart';
import 'package:ecommerce/feature/category/controller/category_controller.dart';
import 'package:ecommerce/feature/auth/register/controller/sign_up_controller.dart';
import 'package:ecommerce/feature/product_screen/controller/product_controller.dart';
import 'package:ecommerce/feature/favorite_screen/controller/favorite_controller.dart';
import 'package:ecommerce/feature/auth/verify_code/controller/verify_email_controller.dart';
import 'package:ecommerce/feature/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/controller/on_barding_controller.dart';
import 'package:ecommerce/feature/auth/forget_password/controller/reset_password_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBardingControllerImp() , fenix: true);
    Get.lazyPut(() => BottomNavBarItem() , fenix: true);
    Get.lazyPut(() => HomeControllerImp() , fenix: true);
    Get.lazyPut(() => ProductControllerImp() , fenix: true);
    Get.lazyPut(() => FavoriteControllerImp() , fenix: true);
    Get.lazyPut(() => CartControllerImp() , fenix: true);
    Get.lazyPut(() => SearchControllerImp() , fenix: true);
    Get.lazyPut(() => CategoryControllerImp() , fenix: true);
    Get.lazyPut(() => LoginControllerImp() , fenix: true);
    Get.lazyPut(() => SignUpControllerImp() , fenix: true);
    Get.lazyPut(() => VerifyControllerImp() , fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImp() , fenix: true);
    // Get.lazyPut(() => MapsControllerImp() , fenix: true);
  }
}
