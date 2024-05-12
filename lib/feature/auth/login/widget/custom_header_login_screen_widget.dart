import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomHeaderLoginScreenWidget extends StatelessWidget {
  const CustomHeaderLoginScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back,".tr,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          "Discover limited choices and unmatched\nconvenience.".tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}