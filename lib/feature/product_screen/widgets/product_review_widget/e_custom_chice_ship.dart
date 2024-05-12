import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_circular_container.dart';

class ECustomChiceShip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function(bool)? onTap;
  const ECustomChiceShip({
    Key? key,
    required this.text,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isColor = EHelperFunction.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox.shrink() : Text(text),
        selected: isSelected,
        onSelected: onTap,
        labelStyle: TextStyle(color: isSelected ? ColorsManger.white : null),
        avatar: isColor
            ? ECusromCircularContainer(
                width: 45.w,
                height: 45.h,
                backGroundColor: EHelperFunction.getColor(text)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? EHelperFunction.getColor(text)! : null,
      ),
    );
  }
}