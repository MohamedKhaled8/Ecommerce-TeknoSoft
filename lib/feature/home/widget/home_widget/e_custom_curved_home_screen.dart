import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/widgets/e_custom_curdev_edges.dart';

class CustomECurvedHomeScreenWidget extends StatelessWidget {
  final Widget? child;

  const CustomECurvedHomeScreenWidget({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: ECustomCurvedEdges(), child: child);
  }
}