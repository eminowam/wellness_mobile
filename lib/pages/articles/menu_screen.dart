import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_mobile/widgets/app_scaffold/app_scaffold.dart';
import 'package:wellness_mobile/widgets/card/article_card.dart';
import 'package:wellness_mobile/widgets/card/menu_card.dart';

import '../../bloc/article_bloc/article_bloc.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleBloc>(context)
        .add((ArticleAllEvent()));
    }
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Блядо',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return MenuCard();
              }),
        ),
      ),
    );
  }
}
