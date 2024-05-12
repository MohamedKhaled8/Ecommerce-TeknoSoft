import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constant/color_manger.dart';
import '../../../core/utils/helper/e-hepler_function.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomTopLangScreen extends StatelessWidget {
  const CustomTopLangScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
       
          Text(
            "choose language".tr,
            style: TextStyle(
                color:EHelperFunction.isDarkMode(context) ? ColorsManger.white : ColorsManger.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
          Text(
            "Choose the language that suits you, dear".tr,
            style: TextStyle(
                color: EHelperFunction.isDarkMode(context)? ColorsManger.white : ColorsManger.black,
                fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
