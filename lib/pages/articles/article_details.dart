import 'package:flutter/material.dart';
import 'package:wellness_mobile/data/models/article/article_model.dart';

import '../../configs/color.dart';

class ArticleDetailsScreen extends StatefulWidget {
  const ArticleDetailsScreen(
      {super.key, required this.results, this.articleId});

  final ArticleModel results;
  final String? articleId;

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bottomColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                isFavorite = !isFavorite;
                setState(() {});
              },
              icon: isFavorite
                  ? const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                    ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Text(
                widget.results.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
                 ClipRRect(
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
              const SizedBox(height: 7),
              Text(
                widget.results.description,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
