import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';

class ECustomGridViewLayoutWidget extends StatelessWidget {
  final double? mainAxisExtent;
  final Widget? Function(BuildContext context, int) itemBuilder;
  final int itemCount;
  const ECustomGridViewLayoutWidget({
    Key? key,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: mainAxisExtent,
            mainAxisSpacing: ELocalSize.gridViewSpacing,
            crossAxisSpacing: ELocalSize.gridViewSpacing),
        itemBuilder: itemBuilder);
  }
}
