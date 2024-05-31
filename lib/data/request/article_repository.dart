import 'package:dio/dio.dart';
import 'package:wellness_mobile/data/models/article/article_model.dart';
import 'package:wellness_mobile/data/models/domain_set.dart';

class ArticleRepository {
  final Dio _dio = Dio();

  Future<List<ArticleModel>> getArticle() async {
    final response = await _dio.get(articlesApi);

    var list = response.data
        .map((items) => ArticleModel.fromJson(items))
        .cast<ArticleModel>()
        .toList();

    return list;
  }
}
