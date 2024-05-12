import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showDialogeAnimations() {
  return showDialog(
    context: Get.overlayContext!,
    builder: (_) => Dialog(
      child: Container(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/json/done.json',
              width: 200.w,
              height: 200.h,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 16.h),
            Text(
              'Creating Account...',
              style: TextStyle(fontSize: 18.sp),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<ImageSource?> buildShowImageSourceDialog(BuildContext context) {
  return showModalBottomSheet<ImageSource?>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'Camera',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pop(ImageSource.camera);
              // Get.offAll(ImageSource.camera);
            },
          ),
          ListTile(
            title: Text(
              'Gallery',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pop(ImageSource.gallery);
            },
          ),
        ],
      );
    },
  );
}

// Future<dynamic> buildUpdateDataProfileScreen(
//     BuildContext context, ProfileControllerImp _controller) {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AlertDialog(
//             title: const Text("Edit Profile"),
//             content: const CustomShowFieldDetailesProfile(),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: const Text("Cancel"),
//               ),
//               TextButton(
//                 onPressed: () {
//                   _controller.updateUserData();
//                   Get.back();
//                 },
//                 child: const Text("Save"),
//               ),
//             ],
//           ),
//         ],
//       );
//     },
//   );
// }
