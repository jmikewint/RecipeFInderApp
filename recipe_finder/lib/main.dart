import 'package:flutter/material.dart';
import 'package:recipe_finder/RecipesHomeScreen.dart';
import 'package:recipe_finder/final_view.dart';
import 'package:recipe_finder/pages/home_page.dart';
import 'package:recipe_finder/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const FinalView(),
    );
  }
}