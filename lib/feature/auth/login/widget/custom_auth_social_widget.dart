import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/image_assets.dart';
import 'package:ecommerce/feature/auth/login/controller/login_controller.dart';
import 'package:ecommerce/feature/auth/login/widget/custom_icon_auth_social.dart';

class CustomAuthSocailWidget extends StatelessWidget {
  const CustomAuthSocailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp _controller = Get.find<LoginControllerImp>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconAuthSocial(
          iconData: Image.asset(AppImageAsset.facebook),
          onPressed: () {},
        ),
        SizedBox(
          width: 20.w,
        ),
        GetBuilder<LoginControllerImp>(builder: (_) {
          return CustomIconAuthSocial(
            iconData: Image.asset(AppImageAsset.google),
            onPressed: () => _controller.googleSignIn(),
          );
        }),
      ],
    );
  }
}
