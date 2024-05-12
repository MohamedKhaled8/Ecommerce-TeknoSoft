import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/widgets/e_custom_rounded_images.dart';

class ECustomSliderPhoto extends StatelessWidget {
  const ECustomSliderPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();
    return CarouselSlider(
      items: List.generate(
       _controller. imagesSlider.length,
        (index) => ECustomRoundedImage(
          width: 320.w,
          imageUrl: _controller.imagesSlider[index],
          isNetworImage: false,
          onPressed: () => Get.toNamed(_controller.banner[index].targetScreen),
        ),
      ),
      options: CarouselOptions(
        viewportFraction: 1,
        onPageChanged: (index, _) {
          _controller.updatePageIndicator(index);
        },
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
    );
  }
}
