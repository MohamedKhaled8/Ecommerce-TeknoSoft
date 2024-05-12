import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_slider_photo.dart';
import 'package:ecommerce/feature/home/widget/home_widget/e_custom_indicator_slider.dart';


class ECustomBodySlider extends StatelessWidget {
  const ECustomBodySlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: [
        const ECustomSliderPhoto(),
         SizedBox(
          height: ELocalSize.spaceBtItems.h,
        ),
        const ECutomIndicatorSlider(),
      ],
    );
  }
}

