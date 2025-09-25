import 'package:flutter/material.dart';

import '../pages/chat_page.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/search_page.dart';



class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  
  int myCurrentIndex = 1;

  List pages = const [
    HomePage(),
    SearchPage(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), 
        decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 30,
              offset: Offset(0, 20),
            )
          ]
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: myCurrentIndex,
            backgroundColor: Colors.white,
            selectedItemColor: const Color.fromARGB(255, 237, 19, 95),
            unselectedItemColor: Colors.black,
            selectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            
            
            items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: 'Favourite'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          
          ]),
        ),
      ),


      body: pages[myCurrentIndex]);
  }
}