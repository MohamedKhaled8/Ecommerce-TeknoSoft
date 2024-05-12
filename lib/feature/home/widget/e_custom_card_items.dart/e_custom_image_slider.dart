import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/product_screen/controller/product_controller.dart';
import 'package:ecommerce/feature/home/widget/e_custom_card_items.dart/e_custom_color_picker.dart';
import 'package:ecommerce/feature/home/widget/e_custom_card_items.dart/e_custom_badge_number_add_product.dart';

class ECustomImageSlidler extends StatelessWidget {
  final String imageUrl;
  const ECustomImageSlidler({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final ProductControllerImp _controller = Get.find<ProductControllerImp>();

    return Stack(children: [
      CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10).r,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
          options: CarouselOptions(
            height: 350.h,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _controller.onPageChangedDetailes(index);
            },
          )),
      Positioned(
        bottom: 30.w,
        left: 180.w,
        child: AnimatedSmoothIndicator(
          activeIndex: _controller.currentPage,
          count: 3,
          effect: ExpandingDotsEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,
            activeDotColor: ColorsManger.blue,
            dotColor: Colors.black,
          ),
        ),
      ),
      Positioned(
        bottom: 30.w,
        right: 30.w,
        child: Container(
          height: 200.h,
          width: 50.w,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _controller.onPageChangedColors(index);
                },
                child: ECustomColorPicker(
                  color: _controller.colorSelected[index],
                  outerBorder: _controller.currentColor == index,
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 3.h),
            itemCount: _controller.colorSelected.length,
          ),
        ),
      ),
      Container(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 25.w,
            right: 25.w,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.all(8).r,
                decoration: BoxDecoration(
                  color: ColorsManger.gray.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10).w,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: EHelperFunction.isDarkMode(context) ? Colors.black : Colors.white,
                    size: 20.h,
                  ),
                ),
              ),
            ),
            ECustomBadgeNumberAddProduct(
              onPressed: () {
                Get.toNamed(AppRoute.cartScreen);
              },
            ),
          ])),
    ]);
  }
}
