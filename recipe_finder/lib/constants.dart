import 'package:flutter/material.dart';
import 'package:recipe_finder/pages/home_page.dart';
import 'package:recipe_finder/sample_widget.dart';
import 'package:recipe_finder/size_config.dart';

List<Widget> screens = [
   HomePage(
    label: 'Bum',
    color: Color(0xFFFFFDF9),
  ),
  const SampleWidget(
    label: 'SEARCH',
    color: Colors.white,
  ),
  const SampleWidget(
    label: 'EXPLORE',
    color: Colors.white,
  ),
  const SampleWidget(
    label: 'SETTINGS',
    color: Colors.white,
  ),
  const SampleWidget(
    label: 'PROFILE',
    color: Colors.white,
  ),
];

double animatedPositionedLeftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 4.5;
    case 1:
      return AppSizes.blockSizeHorizontal * 21.5;
    case 2:
      return AppSizes.blockSizeHorizontal * 38.5;
    case 3:
      return AppSizes.blockSizeHorizontal * 55.5;
    case 4:
      return AppSizes.blockSizeHorizontal * 73.5;
    default:
      return 0;
  }
}
//
// Created by CodeWithFlexZ
// Tutorials on my YouTube
//
//! Instagram
//! @CodeWithFlexZ
//
//? GitHub
//? AmirBayat0
//
//* YouTube
//* Programming with FlexZ
//

final List<Color> gradient = [
  Colors.yellow.withOpacity(0.8),
  Colors.yellow.withOpacity(0.5),
  Colors.transparent
];