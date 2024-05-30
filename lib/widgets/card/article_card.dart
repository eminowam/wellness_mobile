import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_mobile/pages/articles/article_details.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, CupertinoPageRoute(builder: (_) => const ArticleDetailsScreen())),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: 100,
        width: 100,
        child: Stack(
          children: [
            Image.asset('assets/mental/yoga.webp'),
           const  Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'В стране чудес жила была одна принцесса',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
