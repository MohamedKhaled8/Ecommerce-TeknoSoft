import 'package:flutter/material.dart';

class ECustomSectionHeading extends StatelessWidget {
  final Color? color;
  final bool showActionButton;
  final String title;
  final String buttonTitle;
  final void Function()? onPressed;
  const ECustomSectionHeading({
    Key? key,
    this.color,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: color,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}
