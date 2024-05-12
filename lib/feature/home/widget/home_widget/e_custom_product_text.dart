import 'package:flutter/material.dart';

class ECustomProductPriceText extends StatelessWidget {
  final String price;
  final String currencyPrice;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  const ECustomProductPriceText({
    Key? key,
    required this.price,
    this.currencyPrice = '\$',
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(currencyPrice + price,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.titleMedium!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null,
                )
            : Theme.of(context).textTheme.titleMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null));
  }
}
