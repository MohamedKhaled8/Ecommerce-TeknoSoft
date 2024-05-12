import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/cart/controller/cart_controller.dart';
import 'package:ecommerce/feature/auth/login/controller/user_controller.dart';

SnackbarController snakBar({
  required String text,
  required String title,
}) {
  return Get.snackbar(
    text,
    title,
    isDismissible: true,
    shouldIconPulse: true,
    backgroundColor: ColorsManger.orange,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: EdgeInsets.all(20.r),
    icon: const Icon(
      Icons.warning_rounded,
      color: ColorsManger.white,
    ),
  );
}

Future<dynamic> snakBarClearAllItems({
  required Map<dynamic, dynamic> productsMap,
 required BuildContext context,
}) {
  return Get.defaultDialog(
    title: "Clean Products",
    titleStyle: TextStyle(
      fontSize: 18.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    middleText: 'Are you sure you need clear products',
    middleTextStyle: TextStyle(
      fontSize: 18.sp,
      color: ColorsManger.black,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: ColorsManger.grey,
    radius: 10,
    textCancel: " No ",
    cancelTextColor: ColorsManger.red,
    textConfirm: " YES ",
    confirmTextColor: ColorsManger.red,
    onCancel: () {
      // Get.toNamed(Routes.cartScreen);
    },
    onConfirm: () {
      print("Yes button pressed");
      productsMap.clear();
      Get.back();
      Get.find<CartControllerImp>().update();
    },
    buttonColor: EHelperFunction.isDarkMode(context)
        ? ColorsManger.white
        : ColorsManger.white,
  );
}
void showImageSourceDialog(BuildContext context) {
  final UserController _controller = UserController.instance;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Change Profile Picture"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Take a Photo'),
              onTap: () {
                Navigator.pop(context);
                _controller.uploadUserProfilePicture(
                    source: ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                _controller.uploadUserProfilePicture(
                    source: ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    },
  );
}

  // ignore: non_constant_identifier_names
  Future<dynamic> ECustomShowDialogeAddAndREmovePeoduct(BuildContext context, List<String> actionMessage, int index, bool isInCart) {
    return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(actionMessage[index]),
        content: Text(
          isInCart
              ? "The product was removed from the cart."
              : "The product was added to the cart successfully.",
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Ok"),
          ),
        ],
      );
    },
  );
  }