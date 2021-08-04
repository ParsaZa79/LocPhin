import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

final double kToolbarHeight = 56.0;

double appBarHeight(BuildContext context) {
  return screenAwareSize(kToolbarHeight, context);
}

const double kBaseHeight = 650.0;
double screenAwareSize(double size, BuildContext context) {
  double drawingHeight =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * drawingHeight / kBaseHeight;
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

mixin UiUtils {
  static Color primaryColor = Vx.randomPrimaryColor;
  static Color secondaryColor = Vx.randomOpaqueColor;
}
