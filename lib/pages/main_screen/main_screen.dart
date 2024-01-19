import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          ),
        ));
  }
}
