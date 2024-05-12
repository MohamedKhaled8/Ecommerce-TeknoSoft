import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../../../core/Router/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';

class CustomEmptyCart extends StatelessWidget {
  const CustomEmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/json/empty.json',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40.h,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Your Cart is ",
                  style: TextStyle(
                    color: EHelperFunction.isDarkMode(context)
                        ? Colors.white
                        : Colors.black,
                    fontSize: 30.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Empty",
                  style: TextStyle(
                    color: ColorsManger.blue,
                    fontSize: 30.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Add items to get Started",
            style: TextStyle(
              color: EHelperFunction.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 50.h,
            width: 280.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: ColorsManger.blue,
                elevation: 0,
              ),
              onPressed: () {
                Get.toNamed(AppRoute.buttonBavBar);
              },
              child: Text(
                'Go to Home',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
