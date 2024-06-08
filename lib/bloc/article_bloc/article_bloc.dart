
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellness_mobile/data/models/article/article_model.dart';

import '../../data/errror.dart';
import '../../data/request/article_repository.dart';

part 'article_event.dart';

part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository = ArticleRepository();
  final SharedPreferences preferences;

  ArticleBloc(this.preferences) : super(const ArticleState()) {
    on<ArticleAllEvent>(getAllArticle);
  }

  getAllArticle(ArticleAllEvent event, emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      var list = await articleRepository.getArticle();
      emit(state.copyWith(isSuccess: true, list: list));
    } on DioException catch (e) {
      emit(state.copyWith(errors: getMessageErrors(e)));
    }
  }
}
