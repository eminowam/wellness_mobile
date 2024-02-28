import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';

class StepsScreen extends StatelessWidget {
  const StepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold( title: 'Шаги',
      icon2: Icons.arrow_back,
      onPressed2: (){
      Navigator.pop(context);
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Column(
            children: [

            ],
          ),
        ),
      ),);

  }
}
