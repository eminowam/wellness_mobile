import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';

class MentalHealthPage extends StatefulWidget {
  const MentalHealthPage({super.key});

  @override
  State<MentalHealthPage> createState() => _MentalHealthPageState();
}

class _MentalHealthPageState extends State<MentalHealthPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
