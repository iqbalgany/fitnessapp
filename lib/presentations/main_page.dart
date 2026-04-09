import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitnessapp/presentations/pages/home_page.dart';
import 'package:fitnessapp/presentations/pages/profile_page.dart';
import 'package:fitnessapp/presentations/pages/run_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTabIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const RunPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepOrange,
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 500),
        index: currentTabIndex,
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.run_circle, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
