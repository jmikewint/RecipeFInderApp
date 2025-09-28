import 'package:flutter/material.dart';
import 'package:recipe_finder/size_config.dart';

class BottomNavBtn extends StatelessWidget {
  const BottomNavBtn({
    super.key,
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onPressed,
  });

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
        height: AppSizes.blockSizeHorizontal * 13,
        width: AppSizes.blockSizeHorizontal * 17,
        decoration: const BoxDecoration(color: Color.fromARGB(0, 153, 10, 10)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            (currentIndex == index)
                ? Positioned(
                    left: AppSizes.blockSizeHorizontal * 4.5,
                    bottom: AppSizes.blockSizeHorizontal * 1.8,
                    child: Icon(
                      icon,
                      color: Color.fromARGB(144, 36, 21, 21),
                      size: AppSizes.blockSizeHorizontal * 8,
                    ),
                  )
                : Container(),

            AnimatedOpacity(
              opacity: (currentIndex == index) ? 1 : 0.2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              child: Icon(
                icon,
                color: Color.fromARGB(255, 255, 255, 255),
                size: AppSizes.blockSizeHorizontal * 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
