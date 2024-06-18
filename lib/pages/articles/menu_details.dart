import 'package:flutter/material.dart';

import '../../widgets/app_scaffold/app_scaffold.dart';

class MenuDetails extends StatelessWidget {
  const MenuDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "widget.results.title",
        icon2: Icons.arrow_back,
        onPressed2: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  // widget.results.title,
                  "Vegan Mushroom Bean Burger",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  // widget.results.title,
                  "25 min",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 190,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset('assets/mental/yoga.webp')),
                ),
                SizedBox(height: 10,),
                Text(
                  'Пищевая ценность (на порцию)',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [

                  ],
                )
              ],
            ),
          ),
        ));
  }
}
