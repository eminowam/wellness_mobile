

import 'package:flutter/material.dart';
import 'package:wellness_mobile/widgets/app_scaffold/app_scaffold.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Помощь",
      icon2: Icons.arrow_back,
      onPressed2: (){
        Navigator.pop(context);
      },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ),
    );
  }
}
