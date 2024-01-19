import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/main_screen/main_screen.dart';
import 'package:wellness_mobile/pages/mental/mental_health_screen.dart';
import 'package:wellness_mobile/pages/profile/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

List<Widget> screens = [
  const HomePage(),
  const MentalHealthPage(),
  const ProfilePage(),
];
int currentIndex = 0;

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.health_and_safety_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.health_and_safety_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 30,
                ),
                label: "")
          ]),
    );
  }
}