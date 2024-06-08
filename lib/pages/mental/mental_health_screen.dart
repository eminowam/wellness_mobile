import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_mobile/pages/mental/saved_screen.dart';

import '../../bloc/mental_bloc/mental_bloc.dart';
import '../../widgets/app_scaffold/app_scaffold.dart';
import '../../widgets/card/meditaton_card.dart';

class MentalHealthPage extends StatefulWidget {
  const MentalHealthPage({super.key});

  @override
  State<MentalHealthPage> createState() => _MentalHealthPageState();
}

class _MentalHealthPageState extends State<MentalHealthPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MentalBloc>(context).add((GetAllMeditation()));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Медитация',
      icon1: Icons.bookmark_border,
      onPressed: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (_) => const SavedMentalScreen()));
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              BlocBuilder<MentalBloc, MentalState>(
                builder: (context, state) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.list.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return MeditationCard(results: state.list[index]);
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
