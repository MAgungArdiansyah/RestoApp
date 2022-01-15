import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildBlur(
      {required Widget child,
      BorderRadius? borderRadius,
      double sigmaX = 5,
      double sigmaY = 5}) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );
}