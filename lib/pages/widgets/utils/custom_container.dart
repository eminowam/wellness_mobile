import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const CustomContainer({super.key, required this.child,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(11),
            border: Border.all(width: 0.5,color: Colors.white70)
        ),
        child:child
      ),
    );
  }
}
