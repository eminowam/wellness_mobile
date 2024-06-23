import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_mobile/bloc/comment_bloc/comment_bloc.dart';
import 'package:wellness_mobile/configs/color.dart';
import 'package:wellness_mobile/pages/main_screen/main_screen.dart';
import 'package:wellness_mobile/pages/mental/mental_health_screen.dart';
import 'package:wellness_mobile/pages/profile/profile_screen.dart';

import '../data/models/comment/comment.dart';
import '../pages/articles/menu_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}
int currentIndex = 0;


class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    final comment = context.watch<CommentBloc>().state.comment;


    List<Widget> screens = [
      const HomePage(),
      const MentalHealthPage(),
      const ArticleScreen(),
       ProfilePage(comment: comment),
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
          backgroundColor: Colors.white,
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
                  color: navBackgroundColor,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: bottomColor,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.health_and_safety_outlined,
                  color:navBackgroundColor ,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.health_and_safety_outlined,
                  color: bottomColor,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.healing_outlined,
                  color: navBackgroundColor,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.healing_outlined,
                  color: bottomColor,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: navBackgroundColor,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: bottomColor,
                  size: 30,
                ),
                label: "")
          ]),
    );
  }
}