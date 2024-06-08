import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_mobile/widgets/app_scaffold/app_scaffold.dart';
import 'package:wellness_mobile/widgets/card/article_card.dart';

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
      title: 'Статьи',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 5),
            const Text(
              "Все о здоровье",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<ArticleBloc, ArticleState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        (MediaQuery.of(context).size.width * .2) / 80,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ArticleCard(results: state.list[index]);
                  },
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
