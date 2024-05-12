import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import '../../../home/widget/home_widget/e_custom_round_image.dart';
import 'package:ecommerce/feature/auth/login/controller/user_controller.dart';

class ECustomProfileTile extends StatelessWidget {
  final void Function()? onTap;
  const ECustomProfileTile({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController _controller = UserController.instance;
    return ListTile(
      leading: ECustomCircularImage(
        imageUrl: _controller.user.profilePic,
        width: 60.w,
        height: 70.w,
        fit: BoxFit.cover,
      ),
      title: Text(
        _controller.user.firstName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: ColorsManger.white),
      ),
      subtitle: Text(
        _controller.user.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: ColorsManger.white),
      ),
      trailing: IconButton(
          onPressed: onTap,
          icon: const Icon(
            Iconsax.edit,
            color: ColorsManger.white,
          )),
    );
  }
}
