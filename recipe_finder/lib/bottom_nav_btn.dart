import 'package:flutter/material.dart';
import 'package:recipe_finder/size_config.dart';

class BottomNavBtn extends StatelessWidget {
  const BottomNavBtn({super.key, required this.icon, required this.index, required this.currentIndex, required this.onPressed});

  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    AppSizes().initSsizes(context);
    return InkWell(
      onTap: () {
        onPressed(index);
      },
      child: Container(
        height: AppSizes.blockSizeHorizontal *13,
        width: AppSizes.blockSizeHorizontal * 17,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: AnimatedOpacity(
          opacity: (currentIndex == index) ? 1 : .02,
          duration: const Duration(milliseconds: 300),
          child: Icon(
            icon,
            color: Colors.yellow[300],  
            size: AppSizes.blockSizeHorizontal * 8,
            ),
        )
        ),
      );
  }
}
