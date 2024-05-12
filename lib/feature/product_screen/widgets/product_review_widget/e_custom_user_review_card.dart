import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/feature/home/widget/home_widget/custom_circular_container.dart';
import 'package:ecommerce/feature/product_screen/widgets/product_review_widget/e_custom_rating_bar_indicator.dart';

class ECustomUserReviewCard extends StatelessWidget {
  const ECustomUserReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/jpg/mohamed.jpg"),
                ),
                const SizedBox(
                  width: ELocalSize.spaceBtItems,
                ),
                Text(
                  "Jone Doe",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: ELocalSize.spaceBtItems,
        ),
        Row(
          children: [
            const ECustomRatingBarIndicator(rating: 4),
            const SizedBox(
              width: ELocalSize.spaceBtItems,
            ),
            Text(
              '4 March , 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: ELocalSize.spaceBtItems,
        ),
        ReadMoreText(
          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
          trimMode: TrimMode.Line,
          trimLines: 2,
          colorClickableText: Colors.pink,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManger.primary),
          lessStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManger.primary),
        ),
        const SizedBox(
          height: ELocalSize.spaceBtItems,
        ),
        ECustomRoundedContainer(
          backgroundColor: dark ? ColorsManger.darkGray : ColorsManger.grey,
          child: Padding(
            padding: const EdgeInsets.all(ELocalSize.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "E's Store",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '4 March , 2024',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: ELocalSize.spaceBtItems,
                ),
                ReadMoreText(
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManger.primary),
                  lessStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManger.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: ELocalSize.spaceBetweenSection,
        ),
      ],
    );
  }
}