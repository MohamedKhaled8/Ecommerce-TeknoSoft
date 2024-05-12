import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/feature/auth/repository/user_repo.dart';
import 'package:ecommerce/feature/auth/repository/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final UserRepo userRepo = Get.put<UserRepo>(UserRepo());

  UserModel user = UserModel.empty();

  bool profileLoading = false;
  bool imageUploadLoading = false;
  Future<void> fetchuserRecord() async {
    try {
      profileLoading = true;
      final fetchedUser = await userRepo.fetchUserDetails();
      user = fetchedUser;
      update();
    } catch (e) {
      user = UserModel.empty();
    } finally {
      profileLoading = false;
      update();
    }
  }

  Future<void> saveUserRecod(
      UserCredential? userCredential, String password) async {
    try {
      await fetchuserRecord();
      if (user.id!.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUserName(
              userCredential.user!.displayName ?? '');
          final newUser = UserModel(
              username: userName,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              password: password,
              profilePic: userCredential.user!.photoURL ?? '');

          await userRepo.saveUserRecord(newUser);
          // Update the user after saving the record
          user = newUser;
          update();
        }
      }
    } catch (e) {
      Get.snackbar('Data Not Save',
          'Something went Wrong Wile Saving Your Information. Can Re-Save your Data');
    }
  }

  Future<void> uploadUserProfilePicture({ImageSource? source}) async {
    try {
      imageUploadLoading = true;
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(
        source: source ?? ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image == null) return;

      final imageUrl =
          await userRepo.uploadImage('users/Images/Profile/', image);
      final json = {'profilePic': imageUrl};
      await userRepo.updateSingleField(json);
      user.profilePic = imageUrl;
      update();
      Get.snackbar("Congratulations", "Your Profile Image has been Updated");
    } catch (e) {
      Get.snackbar("OhSnap,", "Something went wrong $e");
    } finally {
      imageUploadLoading = false;
    }
  }

  @override
  void onInit() {
    fetchuserRecord();
    super.onInit();
  }
}
