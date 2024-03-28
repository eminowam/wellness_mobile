import 'package:flutter/material.dart';
import 'package:wellness_mobile/configs/color.dart';

class CustomContainer extends StatelessWidget {
  final String textTitle;
  final String textSub;
  final double horizontal;
  const CustomContainer({super.key, required this.textTitle, required this.textSub, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontal,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Colors.white70,
          border: Border.all(
            width: 0.5,
            color: bottomColor,
          ),
        ),
        child:  Column(
          children: [
            Text (textTitle,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
            Text(textSub,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 15),)
          ],
        ),
      ),
    );
  }
}
