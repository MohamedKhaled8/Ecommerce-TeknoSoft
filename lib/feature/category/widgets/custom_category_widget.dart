import 'package:get/get.dart';
import 'custom_category_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/e_shimmer_efect.dart';
import 'package:ecommerce/feature/category/controller/category_controller.dart';

class CustomCategoryWidget extends StatelessWidget {
  const CustomCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagesSlider = [
      "assets/images/jpg/5471204.jpg",
      "assets/images/jpg/jewelery.jpg",
      "assets/images/jpg/means.jpg",
      "assets/images/jpg/womensclothing.jpg",
    ];
    final CategoryControllerImp _controller = Get.find<CategoryControllerImp>();
    // final HomeControllerImp _controllerH = Get.find<HomeControllerImp>();

    return GetBuilder<CategoryControllerImp>(builder: (_) {
      if (_controller.isCatgeoryLoading) {
        return EShimmerEffect(width: 320.w, height: 100.h, radius: 10);
      } else {
        return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _controller.getCategoryIndex(index);
                      Get.to(() => CategoryItems(
                            catehoryTitle: _controller.categoryNameList[index],
                          ));
                    },
                    child: Container(
                        height: 140.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                imagesSlider[index],
                              ),
                              fit: BoxFit.cover,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              _controller.categoryNameList[index],
                              style: TextStyle(
                                backgroundColor: Colors.black38,
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
                itemCount: _controller.categoryNameList.length));
      }
    });
  }
}
