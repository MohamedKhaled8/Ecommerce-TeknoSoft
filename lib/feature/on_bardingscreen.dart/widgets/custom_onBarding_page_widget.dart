import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnBardingPageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const CustomOnBardingPageWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Lottie.asset(
            image,
            width: 200.w,
            height: 200.h,
            fit: BoxFit.fill,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            textAlign: TextAlign.center,
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
