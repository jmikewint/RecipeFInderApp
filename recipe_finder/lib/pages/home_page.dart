import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_finder/tab_item.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:recipe_finder/services.dart';
import 'package:recipe_finder/recipes_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.label, required this.color})
    : super(key: key);

  final String label;
  final Color color;

  Future<List<Recipe>> fetchRecipes() async {
    return await recipesItems();
  }

  List<int> data = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

  Widget _buildItemList(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (index == data.length) {
      return Center(child: CircularProgressIndicator());
    }

    return FutureBuilder<List<Recipe>>(
      future: fetchRecipes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: \\${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No recipes found.'));
        }
        final recipesModel = snapshot.data!;
        final recipes = recipesModel[index];
        return GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(35, 0, 25, 0),
                width: 330,
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        recipes.name,
                        style: TextStyle(
                          color: Color(0xFF32201C),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              size: 15,
                              IconlyBold.time_circle,
                              color: Colors.orange,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                recipes.cookTimeMinutes.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                  color: const Color.fromARGB(255, 197, 52, 52),
                                ),
                              ),
                            ),
                            Text(
                                "min",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                  color: const Color.fromARGB(255, 197, 52, 52),
                                ),
                              ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Text(
                                recipes.rating.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                  color: const Color.fromARGB(255, 197, 52, 52),
                                ),
                              ),
                            ),
                            const Icon(IconlyBold.star, color: Colors.orange, size: 15,),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(
                          0,
                          133,
                          130,
                          130,
                        ).withOpacity(0.5), // Shadow color and opacity
                        spreadRadius: 2, // Extent of the shadow spread
                        blurRadius: 3, // Amount of blur applied to the shadow
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                    image: DecorationImage(
                      image: NetworkImage(recipes.image),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildCard(int index) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Stack(
        children: [
          Container(
            width: 140,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.yellow,
              image: const DecorationImage(
                image: NetworkImage(
                  'https://hips.hearstapps.com/hmg-prod/images/classic-cheese-pizza-recipe-2-64429a0cb408b.jpg?crop=0.6666666666666667xw:1xh;center,top&resize=1200:*',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      0,
                      34,
                      16,
                      16,
                    ).withOpacity(0.5), // Shadow color and opacity
                    spreadRadius: 2, // Extent of the shadow spread
                    blurRadius: 3, // Amount of blur applied to the shadow
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<List<Recipe>>(
      future: fetchRecipes(),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: \\${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No recipes found.'));
        }
        final recipesModel = snapshot.data!;
        return Container(
          decoration: BoxDecoration(color: color),
          child: Column(
            children: [
              CategoryTabs(),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0, 10, 0, 13),
                        child: Align(
                          alignment: AlignmentGeometry.topLeft,
                          child: Text(
                            "Trending Recipes",
                            style: TextStyle(
                              color: Color(0xFFFD5D69),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ScrollSnapList(
                          itemBuilder: _buildItemList,
                          itemSize: 400,
                          onReachEnd: () {
                            print('Done!');
                          },
                          onItemFocus: (index) {},
                          itemCount: data.length,
                        ),
                      ),
                      //Middle Section
                      Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFFD5D69),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Align(
                              alignment: AlignmentGeometry.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'Your Recipes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 185,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(12),
                                itemCount: 10,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 12);
                                },
                                itemBuilder: (context, index) {
                                  return buildCard(index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Chef Section
                      Container(
                        height: 200,
                        width: screenWidth,
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Top Chef'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              const Color.fromARGB(
                                                31,
                                                133,
                                                130,
                                                130,
                                              ).withOpacity(
                                                0.5,
                                              ), // Shadow color and opacity
                                          spreadRadius:
                                              1, // Extent of the shadow spread
                                          blurRadius:
                                              1, // Amount of blur applied to the shadow
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          'https://www.sargento.com/assets/Uploads/Recipe/Image/cheddarbaconcheeseburger__FillWzgwMCw4MDBd.jpg',
                                        ),
                                        fit: BoxFit
                                            .cover, // Adjust how the image fits
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              const Color.fromARGB(
                                                31,
                                                133,
                                                130,
                                                130,
                                              ).withOpacity(
                                                0.5,
                                              ), // Shadow color and opacity
                                          spreadRadius:
                                              1, // Extent of the shadow spread
                                          blurRadius:
                                              1, // Amount of blur applied to the shadow
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          'https://www.sargento.com/assets/Uploads/Recipe/Image/cheddarbaconcheeseburger__FillWzgwMCw4MDBd.jpg',
                                        ),
                                        fit: BoxFit
                                            .cover, // Adjust how the image fits
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              const Color.fromARGB(
                                                31,
                                                133,
                                                130,
                                                130,
                                              ).withOpacity(
                                                0.5,
                                              ), // Shadow color and opacity
                                          spreadRadius:
                                              1, // Extent of the shadow spread
                                          blurRadius:
                                              1, // Amount of blur applied to the shadow
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          'https://www.sargento.com/assets/Uploads/Recipe/Image/cheddarbaconcheeseburger__FillWzgwMCw4MDBd.jpg',
                                        ),
                                        fit: BoxFit
                                            .cover, // Adjust how the image fits
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              const Color.fromARGB(
                                                31,
                                                133,
                                                130,
                                                130,
                                              ).withOpacity(
                                                0.5,
                                              ), // Shadow color and opacity
                                          spreadRadius:
                                              1, // Extent of the shadow spread
                                          blurRadius:
                                              1, // Amount of blur applied to the shadow
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          'https://www.sargento.com/assets/Uploads/Recipe/Image/cheddarbaconcheeseburger__FillWzgwMCw4MDBd.jpg',
                                        ),
                                        fit: BoxFit
                                            .cover, // Adjust how the image fits
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
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
