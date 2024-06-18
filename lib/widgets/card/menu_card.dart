import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/articles/menu_details.dart';

import '../../configs/color.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        elevation: 3,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (_) => const MenuDetails()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 0.5,
                color: mainBackColor,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset('assets/mental/yoga.webp')),
                ),
                const SizedBox(width: 7),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // widget.results.title,
                      "Vegan Mushroom Bean Burger",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      // widget.results.title,
                      "25 min",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
