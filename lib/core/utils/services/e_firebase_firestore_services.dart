import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ecommerce/core/utils/error/handel_error.dart';


class EFirebaseStorgeServices extends GetxController {
  static EFirebaseStorgeServices get instance => Get.find();

  final FirebaseStorage _db = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

      return imageData;
    } catch (e) {
      throw "Error loading image data: $e";
    }
  }

  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _db.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      handleError(e);
      throw Exception("Failed to retrieve download URL for the image.");
    }
  }
  Future<String> uploadImageFile(
      String path, XFile image) async {
    try {
      final ref = _db.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      handleError(e);
      throw Exception("Network Error :${e.toString()}");
    }
  }
}
