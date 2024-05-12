import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ecommerce/core/utils/error/handel_error.dart';
import 'package:ecommerce/feature/auth/repository/user_model.dart';
import 'package:ecommerce/feature/auth/repository/auth_repository.dart';

class UserRepo extends GetxController {
  static UserRepo get instace => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());
    } catch (e) {
      handleError(e);
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("users")
          .doc(AuthRepository.instace.authUser?.uid)
          .get();

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
           handleError(e);
      throw 'something wentwring please try again, ';
    }
  }

  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } catch (e) {
      handleError(e);
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("users")
          .doc(AuthRepository.instace.authUser?.uid)
          .update(json);
    } catch (e) {
      handleError(e);
    }
  }

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("users").doc(userId).delete();
    } catch (e) {
      handleError(e);
    }
  }

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      handleError(e);
      throw Exception("Failed to retrieve download URL for the image.");
    }
  }
}
