import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/article_bloc/article_bloc.dart';
import '../../widgets/app_scaffold/app_scaffold.dart';
import '../../widgets/card/article_card.dart';
import '../../widgets/card/swiper.dart';
import '../../widgets/utils/custom_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleBloc>(context).add(((ArticleAllEvent())));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Wellness App",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const SwiperImage(),
                const SizedBox(
                  height: 20,
                ),
                const CustomSearchField(),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(height: 10),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     CustomContainer(
                //         textTitle: '2234', textSub: 'шагов', horizontal: 55),
                //     CustomContainer(
                //         textTitle: '5ч 45м', textSub: 'сон', horizontal: 45),
                //   ],
                // ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(height: 5),
                Text(
                  "Все о здоровье",
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
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
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
