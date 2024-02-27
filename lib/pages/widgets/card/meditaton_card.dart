import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/mental/yoga_details.dart';

import '../../../configs/color.dart';

class MeditationCard extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;

  const MeditationCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  State<MeditationCard> createState() => _MeditationCardState();
}

class _MeditationCardState extends State<MeditationCard> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        elevation: 15,
        child: InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (_)=>const YogaDetails()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 0.5,
                color: mainBackColor,
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  widget.image,
                  fit: BoxFit.fill,
                  width: 50,
                  height: 60,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        widget.subTitle,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      isLike = !isLike;
                      setState(() {});
                    },
                    icon: isLike
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
