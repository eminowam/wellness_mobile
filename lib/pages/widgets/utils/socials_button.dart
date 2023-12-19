import 'package:flutter/material.dart';

class SocialsButton extends StatelessWidget {
  const SocialsButton({super.key, required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const  EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: const BorderSide(
          width: 1.0,
          color: Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(icon),
          ),
          const  SizedBox(width: 10,),
          Text(title),
        ],
      ),
    );
  }
}