import 'package:flutter/material.dart';
import 'package:peerup/homepage/homepage.dart';
import 'package:peerup/homepage/profile.dart';
import 'package:peerup/homepage/technique.dart';
import 'package:peerup/progress/to-do-page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Widget> pages = [
    Homepage(),
    Techniques(),
    Tasks(),
    Profile(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

// Navigation Bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor:Color(0xFFFDFCF8),
        selectedItemColor:Color(0xFF0FA3B1),
        unselectedItemColor: Color(0xFFB1B3BD),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 2,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_rounded)),
          BottomNavigationBarItem(label: 'Technique', icon: Icon(Icons.book_rounded)),
          BottomNavigationBarItem(label: 'Tasks', icon: Icon(Icons.checklist_rounded)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person_rounded)),
        ],
      ),
    );
  }
}
