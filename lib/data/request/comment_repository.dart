import 'package:dio/dio.dart';
import 'package:wellness_mobile/data/domain_set.dart';
import 'package:wellness_mobile/data/models/comment/comment.dart';

class CommentRepository {
  final Dio _dio = Dio();

  Future<void> createComment(CommentModel comment) async {
    await _dio.post(commentApi, data: comment.toJson());
  }
}
