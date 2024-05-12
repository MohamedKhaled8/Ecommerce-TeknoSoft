import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ecommerce/ecommerce_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/payment_api.dart';
import 'package:ecommerce/core/utils/network/network_services.dart';
import 'package:ecommerce/feature/auth/repository/auth_repository.dart';
import 'package:ecommerce/feature/auth/login/data/repo/login_repo.dart';
import 'package:ecommerce/feature/auth/login/controller/user_controller.dart';
import 'package:ecommerce/feature/auth/forget_password/repo/forget_repo.dart';
import 'package:ecommerce/feature/auth/register/data/repo/register_repo.dart';
import 'package:ecommerce/feature/auth/verify_code/data/repo/verify_repo.dart';
import 'package:ecommerce/core/utils/services/localization_services/local_sevices.dart';

//لو مقفول او بره
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("============== Background Message");
  debugPrint(message.notification!.title);
  debugPrint(message.notification!.body);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = PayMentApi.pusblishableKey;
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  await initialServices();
  await Firebase.initializeApp().then((value) {
    Get.put<LoginRepo>(LoginRepo());
    Get.put<AuthRepository>(AuthRepository());
    Get.put<RegisterRepo>(RegisterRepo());
    Get.put<VerifyRepo>(VerifyRepo());
    Get.put<ForgetRepo>(ForgetRepo());
    Get.put<NetworMangerServices>(NetworMangerServices());
    Get.put<UserController>(UserController());
    Get.put<MyServices>(MyServices());
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const EcommerceStore());
}
