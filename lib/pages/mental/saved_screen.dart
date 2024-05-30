import 'package:flutter/material.dart';
import 'package:wellness_mobile/configs/color.dart';

import '../../data/db_helper/db_helper.dart';
import '../../widgets/card/meditaton_card.dart';

class SavedMentalScreen extends StatefulWidget {
  const SavedMentalScreen({super.key});

  @override
  State<SavedMentalScreen> createState() => _SavedMentalScreenState();
}

class _SavedMentalScreenState extends State<SavedMentalScreen> {
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    initPref();
    super.initState();
  }

  List<int> ids = [];
  bool isLoading = true;

  initPref() async {
    databaseHelper = DatabaseHelper();
    await databaseHelper.initSharedPref();
    ids = databaseHelper.getSavedData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return const  CircularProgressIndicator();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bottomColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close,color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text(
                'Избранные',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              const SizedBox(height: 8,),
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
