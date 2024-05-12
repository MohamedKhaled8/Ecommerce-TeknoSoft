import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class ECustomSettingMenuTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final void Function()? onTap;
  const ECustomSettingMenuTile({
    Key? key,
    required this.iconData,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26.h,
        color: ColorsManger.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}