import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellness_mobile/data/models/article/article_model.dart';

import '../../data/request/article_repository.dart';

part 'article_event.dart';

part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository = ArticleRepository();
  final SharedPreferences preferences;

  ArticleBloc(this.preferences) : super(ArticleInitial()) {
    on<ArticleAllEvent>(getAllArticle);
  }

  getAllArticle(ArticleAllEvent event, emit) async {
    emit(ArticleLoading());
    try {
      var list = await articleRepository.getArticle();
      emit(ArticleSuccess(list));
    } catch (e) {
      emit(ArticleError());
    }
  }
}
