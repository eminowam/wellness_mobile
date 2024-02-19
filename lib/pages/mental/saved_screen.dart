import 'package:flutter/material.dart';
import 'package:wellness_mobile/configs/color.dart';
import 'package:wellness_mobile/pages/widgets/card/meditaton_card.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBackColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Закладки',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              SizedBox(height: 8,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
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
