import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';

class ECustomRatingBarIndicator extends StatelessWidget {
  final double rating;
  const ECustomRatingBarIndicator({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20.h,
        itemBuilder: (_, index) {
          return const Icon(
            Iconsax.star1,
            color: ColorsManger.primary,
          );
        });
  }
}

