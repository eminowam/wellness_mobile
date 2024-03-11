import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const CustomContainer({super.key, required this.child,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white70,
      borderRadius: BorderRadius.circular(10),
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
