import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final IconData? icon1;
  final IconData? icon2;
  final VoidCallback? onPressed;
  final VoidCallback? onPressed2;

  const AppScaffold(
      {super.key,
      required this.child,
      required this.title,
      this.icon1,
      this.onPressed,
      this.icon2,
      this.onPressed2});

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
        leading: IconButton(
            onPressed: onPressed2,
            icon: Icon(icon2, color: const Color(0xff5F5F5F))),
        actions: [
          IconButton(
              onPressed: onPressed,
              icon: Icon(icon1, color: const Color(0xff5F5F5F)))
        ],
      ),
      body: child,
    );
  }
}
