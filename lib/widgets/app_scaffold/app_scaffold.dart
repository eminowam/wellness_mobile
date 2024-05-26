import 'package:flutter/material.dart';
import 'package:wellness_mobile/configs/color.dart';

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
        backgroundColor: bottomColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20,color: Colors.white),
        ),
        leading: IconButton(
            onPressed: onPressed2,
            icon: Icon(icon2, color: Colors.white)),
        actions: [
          IconButton(
              onPressed: onPressed,
              icon: Icon(icon1, color: Colors.white70))
        ],
      ),
      body: child,
    );
  }
}
