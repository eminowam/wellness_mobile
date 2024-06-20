import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/article_bloc/article_bloc.dart';
import '../../widgets/app_scaffold/app_scaffold.dart';
import '../../widgets/card/article_card.dart';
import '../../widgets/card/swiper.dart';

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
                // const CustomSearchField(),
                TextFormField(
                  decoration: InputDecoration(
                    focusColor: const Color(0xff797979),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.7,
                      ),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    hintText: "Найти ",
                    hintStyle: const TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: Color(0xff797979)),
                    prefixIconColor: Colors.black,
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {

                    });
                    },
                ),
                const SizedBox(
                  height: 15,
                ),
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
