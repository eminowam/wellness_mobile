import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_mobile/data/models/article/article_model.dart';
import 'package:wellness_mobile/pages/articles/article_details.dart';

import '../../bloc/article_bloc/article_bloc.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({super.key, required this.results});

  final ArticleModel results;

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        return InkWell(
          onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (_) => ArticleDetailsScreen(
                        results: widget.results,
                      ))),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 100,
            width: 100,
            child: Stack(
              children: [
                Container(
                  width: 190,
                  height: 190,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      widget.results.image,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error);
                      },
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.results.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
