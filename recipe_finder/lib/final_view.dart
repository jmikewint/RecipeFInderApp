import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_finder/bottom_nav_btn.dart';
import 'package:recipe_finder/constants.dart';
import 'package:recipe_finder/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  int _currentIndex = 0;
  late final PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().initSsizes(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Color(0xFFFFFDF9),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hi! Dianne",
              style: TextStyle(
                color: Color(0xFFFD5D69),
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "What are you cooking today",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w100,
                fontSize: 16,
              ),
            ),
          ],
        ),

        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Material(
              child: Ink(
                decoration: ShapeDecoration(
                  color: Color(0xFFFFC6C9),
                  shape: CircleBorder(),
                ),
                child: SizedBox(
                  width: 34.0,
                  height: 34.0,
                  child: IconButton(
                    color: Color(0xFFEC888D),
                    iconSize: 23.0,
                    padding: EdgeInsets.zero,
                    icon: Icon(IconlyLight.notification),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Material(
              child: Ink(
                decoration: ShapeDecoration(
                  color: Color(0xFFFFC6C9),
                  shape: CircleBorder(),
                ),
                child: SizedBox(
                  width: 34.0,
                  height: 34.0,
                  child: IconButton(
                    color: Color(0xFFEC888D),
                    iconSize: 20.0,
                    padding: EdgeInsets.zero,
                    icon: Icon(IconlyLight.search),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                controller: pageController,
                children: screens,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
              ),
            ),
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
        AppSizes.blockSizeHorizontal * 12.5,
        0,
        AppSizes.blockSizeHorizontal * 12.5,
        40,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          width: AppSizes.screenWidth,
          height: AppSizes.blockSizeHorizontal * 13,//Edit this
          decoration: BoxDecoration(
            color: Color(0xFFFD5D69),
            borderRadius: BorderRadius.circular(80),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomNavBtn(
                      icon: IconlyLight.home,
                      currentIndex: _currentIndex,
                      index: 0,
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    BottomNavBtn(
                      icon: IconlyLight.chat,
                      currentIndex: _currentIndex,
                      index: 1,
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    BottomNavBtn(
                      icon: IconlyLight.category,
                      currentIndex: _currentIndex,
                      index: 2,
                      onPressed: (val) {
                        animateToPage(val);
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
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
              left: animatedPositionedLeftValue(_currentIndex),
              bottom: 7,
              child: Container(
                    height: AppSizes.blockSizeHorizontal * .7,
                    width: AppSizes.blockSizeHorizontal * 8,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10)
                    ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
