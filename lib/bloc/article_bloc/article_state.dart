part of 'article_bloc.dart';

@immutable
sealed class ArticleState extends Equatable {
  const ArticleState();
}

final class ArticleInitial extends ArticleState {
  @override
  List<Object> get props => [];
}

final class ArticleLoading extends ArticleState {
  @override
  List<Object> get props => [];
}

final class ArticleError extends ArticleState {
  @override
  List<Object> get props => [];
}

final class ArticleSuccess extends ArticleState {
  final List<ArticleModel> list;

  const ArticleSuccess(this.list);

  @override
  List<Object> get props => [list];
}
