import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_mobile/data/models/article/mental_model.dart';
import 'package:wellness_mobile/data/models/article/mental_model.dart';
import 'package:wellness_mobile/pages/mental/yoga_details.dart';

import '../../../configs/color.dart';
import '../../bloc/mental_bloc/mental_bloc.dart';
import '../../data/db_helper/db_helper.dart';

class MeditationCard extends StatefulWidget {
  final MeditationModel results;

  const MeditationCard({super.key, required this.results});

  @override
  State<MeditationCard> createState() => _MeditationCardState();
}

class _MeditationCardState extends State<MeditationCard> {
  bool isLike = false;

  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  initSharedPref() async {
    databaseHelper = DatabaseHelper();
    databaseHelper.initSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        elevation: 3,
        child: BlocBuilder<MentalBloc, MentalState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => YogaDetails(
                              results: widget.results,
                            )));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 0.5,
                    color: mainBackColor,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          widget.results.image,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.results.title,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.results.description,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          // await databaseHelper
                          //     .saveData();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Saved')),
                          );

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
            );
          },
        ),
      ),
    );
  }
}
