import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/device/e_device_utils.dart';

class ECustomRatingProgressIndicator extends StatelessWidget {
  final String text;
  final double value;
  const ECustomRatingProgressIndicator({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: Container(
            width: EDeviceUtiles.getScreenWidth(context) * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: ColorsManger.gray),
            ),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: ColorsManger.gray,
              valueColor: const AlwaysStoppedAnimation(ColorsManger.primary),
            ),
          ),
        )
      ],
    );
  }
}