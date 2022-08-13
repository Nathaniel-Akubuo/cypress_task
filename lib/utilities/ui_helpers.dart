import 'package:flutter/material.dart';

// PADDING
const kMainPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
const k4pxPadding = EdgeInsets.symmetric(horizontal: 4, vertical: 4);
const k8pxPadding = EdgeInsets.symmetric(horizontal: 8, vertical: 8);

// DECORATIONS
const k8pxBorderRadius = BorderRadius.all(Radius.circular(8));
const k4pxBorderRadius = BorderRadius.all(Radius.circular(4));

// HORIZONTAL-SPACING
const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegular = SizedBox(width: 15.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

Widget horizontalSpaceCustom(double width) => SizedBox(width: width);

// VERTICAL-SPACING
const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegular = SizedBox(height: 15.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);

Widget verticalSpaceCustom(double height) => SizedBox(height: height);
