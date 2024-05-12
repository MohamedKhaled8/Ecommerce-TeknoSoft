import 'package:flutter/material.dart';
import 'package:ecommerce/feature/product_screen/widgets/product_review_widget/e_custom_rating_progress_indicator.dart';

class ECustomOverAllProductRating extends StatelessWidget {
  const ECustomOverAllProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "4.8",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              ECustomRatingProgressIndicator(
                text: '5',
                value: 1.0,
              ),
              ECustomRatingProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              ECustomRatingProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              ECustomRatingProgressIndicator(
                text: '2',
                value: 0.4,
              ),
              ECustomRatingProgressIndicator(
                text: '1',
                value: 0.2,
              ),
            ],
          ),
        )
      ],
    );
  }
}