import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/widgets/app_scaffold/app_scaffold.dart';
import 'package:wellness_mobile/pages/widgets/card/meditaton_card.dart';

class MentalHealthPage extends StatefulWidget {
  const MentalHealthPage({super.key});

  @override
  State<MentalHealthPage> createState() => _MentalHealthPageState();
}

class _MentalHealthPageState extends State<MentalHealthPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Медитации',
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return const MeditationCard(
                        image: 'assets/mental/yoga.webp',
                        title: 'Как медитировать',
                        subTitle:
                            "Пару слов о том как медитировать и почему стоит м главное как это правильно сделать? ");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
