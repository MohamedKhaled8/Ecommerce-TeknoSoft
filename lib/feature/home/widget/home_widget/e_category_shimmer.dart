import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/e_shimmer_efect.dart';

class ECategoryShimmer extends StatelessWidget {
  final int itemCount;
  const ECategoryShimmer({
    Key? key,
     this.itemCount = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EShimmerEffect(width: 52.w, height: 52.h, radius: 52.h),
              SizedBox(
                height: ELocalSize.spaceBtItems.h / 2,
              ),
              EShimmerEffect(width: 52.w, height: 5.h, radius: 0.h),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
        return  SizedBox(
            width: ELocalSize.spaceBtItems.w,
          );
        },
      ),
    );
  }
}