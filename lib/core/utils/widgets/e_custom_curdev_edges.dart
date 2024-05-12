import 'package:flutter/material.dart';

class ECustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firestCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firestCurve.dx, firestCurve.dy, lastCurve.dx, lastCurve.dy);

    final secoundFirestCurve = Offset(0, size.height - 20);
    final secoundLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secoundFirestCurve.dx, secoundFirestCurve.dy,
        secoundLastCurve.dx, secoundLastCurve.dy);

    final thirdFirestCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirestCurve.dx, thirdFirestCurve.dy,
        thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}