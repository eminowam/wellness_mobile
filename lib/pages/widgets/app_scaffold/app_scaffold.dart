import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final IconData? icon;

  const AppScaffold(
      {super.key, required this.child, required this.title, this.icon});

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
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(icon, color: const Color(0xff5F5F5F)))
        ],
      ),
      body: child,
    );
  }
}
