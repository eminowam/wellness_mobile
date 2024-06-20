import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_mobile/widgets/app_scaffold/app_scaffold.dart';
import 'package:wellness_mobile/widgets/card/menu_card.dart';

import '../../bloc/food_bloc/food_bloc.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FoodBloc>(context)
        .add((GetAllFoods()));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Еда',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.list.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return MenuCard(results: state.list[index],);
                  });
            },
          ),
        ),
      ),
    );
  }
}
