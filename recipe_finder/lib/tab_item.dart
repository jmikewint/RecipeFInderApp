import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          SizedBox(
            height: 25,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              padding: const EdgeInsets.only(left: 10),
            
              indicator: BoxDecoration(
                color: Color(0xFFFD5D69),
                borderRadius: BorderRadius.circular(280),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black54,
            
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              onTap: (selectedTabIndex) {},
              tabs: [
                Tab(
                  child: Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Align(
                      child: Text(
                        'Breakfast',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    child: Align(
                      child: Text(
                        'Lunch',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    child: Align(
                      child: Text(
                        'Dinner',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    child: Align(
                      child: Text(
                        'Vegan',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
