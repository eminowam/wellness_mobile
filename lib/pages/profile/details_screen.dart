import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/profile/profile_screen.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';

class DetailsProfileScreen extends StatefulWidget {
  const DetailsProfileScreen({super.key});

  @override
  State<DetailsProfileScreen> createState() => _DetailsProfileScreenState();
}

class _DetailsProfileScreenState extends State<DetailsProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: '',
      icon2: Icons.arrow_back,
      onPressed2: (){
        Navigator.pop(context);
      },
      child: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ), );
  }
}
