import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';

class ECustomSearchHomeScreenWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool showBackGround;
  final bool showBorder;
  final EdgeInsetsGeometry padding;
  const ECustomSearchHomeScreenWidget({
    Key? key,
    required this.text,
    this.icon,
    this.padding =
        const EdgeInsets.symmetric(horizontal: ELocalSize.defaultSpace),
    this.showBorder = true,
    this.showBackGround = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();
    final dark = EHelperFunction.isDarkMode(context);
    return Padding(
      padding: padding,
      child: GetBuilder<HomeControllerImp>(builder: (_) {
        return TextFormField(
          controller: _controller.searchTextCont,
          cursorColor: ColorsManger.black,
          keyboardType: TextInputType.text,
          onChanged: (searchName) {
            _controller.addSearchToList(searchName);
          },
          decoration: BuildInbutDecorationSearched(dark, _controller),
        );
      }),
    );
  }

  InputDecoration BuildInbutDecorationSearched(
      bool dark, HomeControllerImp _controller) {
    return InputDecoration(
      fillColor: dark ? ColorsManger.black : ColorsManger.white,
      focusColor: dark ? ColorsManger.black : ColorsManger.white,
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
        size: 25.h,
      ),
      suffixIcon: _controller.searchTextCont.text.isNotEmpty
          ? IconButton(
              onPressed: () {
                _controller.clearSearch();
              },
              icon: Icon(
                Icons.close,
                color: Get.isDarkMode ? ColorsManger.white : ColorsManger.black,
              ),
            )
          : null,
      hintText: "Search with name & price".tr,
      hintStyle: TextStyle(
        color: dark ? ColorsManger.white : ColorsManger.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: dark ? ColorsManger.white : ColorsManger.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: dark ? ColorsManger.white : ColorsManger.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: dark ? ColorsManger.white : ColorsManger.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: dark ? ColorsManger.white : ColorsManger.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
