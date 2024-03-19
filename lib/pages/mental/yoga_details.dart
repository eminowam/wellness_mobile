import 'package:flutter/material.dart';
import 'package:wellness_mobile/configs/color.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';
import 'package:wellness_mobile/pages/widgets/utils/custom_button.dart';

class YogaDetails extends StatelessWidget {
  const YogaDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Как медитировать',
        icon2: Icons.arrow_back,
        onPressed2: () {
          Navigator.pop(context);
        },
        child: SingleChildScrollView(
          child: Column(children: [
            const Image(image: AssetImage('assets/mental/yoga.webp')),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 23, right: 23, left: 23, bottom: 43),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Full Body Stretch",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "15 min",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Do you love yoga, but you’re not in the mood to break"
                      "a sweat every time you sit at the mat? Maybe you "
                      "just want to meditate and stretch, to contemplate"
                      "your day and wish your cares away for a moment."
                      "This school focuses on deliveringhigh-quality "
                      "and free yoga videos to people around the globe.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.55),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                        width: 350, // <-- Your width
                        height: 48,
                        child: CustomButton(title: 'Start', onPressed: () {  },)

                ),
                ]
              ),
              )
            )
          ]),
        ));
  }
}
