import 'package:flutter/material.dart';
import 'package:recipe_finder/services.dart';
import 'package:recipe_finder/recipes_model.dart';

class RecipesHomeScreen extends StatelessWidget {
  const RecipesHomeScreen({super.key});

  Future<List<Recipe>> fetchRecipes() async {
    return await recipesItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recipes App From API")),
      body: FutureBuilder<List<Recipe>>(
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
          return ListView.builder(
            shrinkWrap: true,
            itemCount: recipesModel.length,
            itemBuilder: (context, index) {
              final recipes = recipesModel[index];
              return Padding(
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: NetworkImage(recipes.image),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: const [
                            BoxShadow(color: Colors.black, offset: Offset(-5, 7)),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    recipes.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const Icon(Icons.star, color: Colors.orange),
                              Text(
                                recipes.rating.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 15),
                              Text(
                                recipes.cookTimeMinutes.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "min",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 15,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
