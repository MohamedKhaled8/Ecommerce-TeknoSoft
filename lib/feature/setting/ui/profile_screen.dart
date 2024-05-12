import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import '../../../core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/themes/snakBar.dart';
import 'package:ecommerce/core/utils/themes/e_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/e_shimmer_efect.dart';
import 'package:ecommerce/feature/auth/login/controller/user_controller.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_round_image.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_section_heading.dart';
import 'package:ecommerce/feature/setting/widgets/profile_screen_widget/e_custom_profile_menu.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController _controller = UserController.instance;

    return Scaffold(
      appBar: const EAppBar(
        showBackArrowButton: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ELocalSize.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    GetBuilder<UserController>(builder: (_) {
                      final networkImage = _controller.user.profilePic;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : "assets/images/jpg/mohamed.jpg";

                      return _controller.imageUploadLoading
                          ? EShimmerEffect(
                              width: 75.w, height: 75.h, radius: 75.h)
                          : ECustomCircularImage(
                              imageUrl: image,
                              width: 120.w,
                              height: 120.w,
                              fit: BoxFit.cover,
                            );
                    }),
                    TextButton(
                        onPressed: () => showImageSourceDialog(context),
                        child: const Text("Change Profile Picture")),
                  ],
                ),
              ),
              const SizedBox(
                height: ELocalSize.spaceBtItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: ELocalSize.spaceBtItems,
              ),
              const ECustomSectionHeading(title: "Profile Information"),
              const SizedBox(
                height: ELocalSize.spaceBtItems,
              ),
              GetBuilder<UserController>(builder: (_) {
                return ECustomProfileMenu(
                  title: 'Name',
                  value: _controller.user.firstName,
                  onTap: () => Get.toNamed(AppRoute.changeName),
                );
              }),
              GetBuilder<UserController>(builder: (_) {
                return ECustomProfileMenu(
                  title: 'Last Name',
                  value: _controller.user.username,
                  onTap: () {},
                );
              }),
              const SizedBox(
                height: ELocalSize.spaceBtItems,
              ),
              const Divider(),
              const SizedBox(
                height: ELocalSize.spaceBtItems,
              ),
              const ECustomSectionHeading(title: "Profile Information"),
              const SizedBox(
                height: ELocalSize.spaceBtItems,
              ),
              ECustomProfileMenu(
                title: 'User Id',
                value: _controller.user.id ?? '',
                onTap: () {},
                iconData: Iconsax.copy,
              ),
              GetBuilder<UserController>(builder: (_) {
                return ECustomProfileMenu(
                  title: 'E-mail',
                  value: _controller.user.email,
                  onTap: () {},
                );
              }),
              GetBuilder<UserController>(builder: (_) {
                return ECustomProfileMenu(
                  title: 'Phone Number',
                  value: _controller.user.phoneNumber,
                  onTap: () {},
                );
              }),
              ECustomProfileMenu(
                title: 'Gender',
                value: 'Male',
                onTap: () {},
              ),
              ECustomProfileMenu(
                title: 'Date of Birth',
                value: '18 Dec 2001',
                onTap: () {},
              ),
              const Divider(),
              const SizedBox(
                height: ELocalSize.spaceBtItems,
              ),
              const Center(
                child: Text(
                  'Close Account',
                  style: TextStyle(color: ColorsManger.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
