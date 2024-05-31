part of 'article_bloc.dart';

@immutable

sealed class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class ArticleAllEvent extends ArticleEvent {
  @override
  List<Object?> get props => [];
}
