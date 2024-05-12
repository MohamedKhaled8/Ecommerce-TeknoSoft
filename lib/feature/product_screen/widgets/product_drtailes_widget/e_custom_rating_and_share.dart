import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';

class ECustomRatingAndShare extends StatelessWidget {
  const ECustomRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 22.h,
            ),
            const SizedBox(
              width: ELocalSize.spaceBtItems / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: '5.0',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const TextSpan(text: ' (199)')
            ]))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: ELocalSize.iconMd,
            ))
      ],
    );
  }
}