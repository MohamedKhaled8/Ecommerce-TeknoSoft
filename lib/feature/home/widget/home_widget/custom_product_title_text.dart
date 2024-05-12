import 'package:flutter/material.dart';

class CustomProductTitleText extends StatelessWidget {
  final String title;
  final bool smalSize;
  final int maxLines;
  final TextAlign? textAlign;
  const CustomProductTitleText({
    Key? key,
    required this.title,
     this.smalSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smalSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}