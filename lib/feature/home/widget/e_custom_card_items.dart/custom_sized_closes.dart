import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/feature/product_screen/controller/product_controller.dart';

class CustomSizedCloses extends StatelessWidget {
  const CustomSizedCloses({super.key});

  @override
  Widget build(BuildContext context) {
  final ProductControllerImp _controller = Get.find<ProductControllerImp>();

    return Container(
      height: 55.h,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10).w,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GetBuilder<ProductControllerImp>(builder: (_) {
            return InkWell(
              onTap: () {
                _controller.changeColorButtom(index);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10).w,
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? _controller.currentIndexx == index
                          ? ColorsManger.blue.withOpacity(0.4)
                          : Colors.black
                      : _controller.currentIndexx == index
                          ? ColorsManger.blue.withOpacity(0.4)
                          : Colors.white,
                  borderRadius: BorderRadius.circular(15).r,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.4),
                    width: 2.w,
                  ),
                ),
                child: Text(
                  _controller.sizeList[index],
                  style: TextStyle(
                    color: Get.isDarkMode
                        ? _controller.currentIndexx == index
                            ? Colors.white
                            : Colors.white
                        : _controller.currentIndexx == index
                            ? Colors.black
                            : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          });
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 10.w,
        ),
        itemCount: _controller.sizeList.length,
      ),
    );
  }
}
