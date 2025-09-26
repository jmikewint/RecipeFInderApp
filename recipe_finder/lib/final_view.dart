import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_finder/bottom_nav_btn.dart';
import 'package:recipe_finder/size_config.dart';

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppSizes().initSsizes(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text(
          "Custom Bottom Navigation Bar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: Container(color: Colors.deepPurpleAccent)),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _buildBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSizes.blockSizeHorizontal * 4.5,
        0,
        AppSizes.blockSizeHorizontal * 4.5,
        70,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          width: AppSizes.screenWidth,
          height: AppSizes.blockSizeHorizontal * 18,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomNavBtn(
                icon: IconlyLight.home,
                currentIndex: _currentIndex,
                index: 0,
                onPressed: (val) {
                  setState(() {
                    _currentIndex = val;
                  });
                },
              ),
              BottomNavBtn(
                icon: IconlyLight.search,
                currentIndex: _currentIndex,
                index: 1,
                onPressed: (val) {
                  setState(() {
                    _currentIndex = val;
                  });
                },
              ),
              BottomNavBtn(
                icon: IconlyLight.chat,
                currentIndex: _currentIndex,
                index: 2,
                onPressed: (val) {
                  setState(() {
                    _currentIndex = val;
                  });
                },
              ),
              BottomNavBtn(
                icon: IconlyLight.profile,
                currentIndex: _currentIndex,
                index: 3,
                onPressed: (val) {
                  setState(() {
                    _currentIndex = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
