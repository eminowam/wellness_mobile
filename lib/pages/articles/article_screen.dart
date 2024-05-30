import 'package:flutter/material.dart';
import 'package:wellness_mobile/widgets/app_scaffold/app_scaffold.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Статьи',
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [

              ],
            ),
          ),
        ),
        );
  }
}
