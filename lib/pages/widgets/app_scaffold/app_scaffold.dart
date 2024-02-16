import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;

  const AppScaffold({super.key, required this.child, required this.title});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAECE5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        leading: Container(),
      ),
      body: child,
    );
  }
}
