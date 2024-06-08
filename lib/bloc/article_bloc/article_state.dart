part of 'article_bloc.dart';

@immutable
class ArticleState extends Equatable {
  final bool isLoading;
  final List<String> errors;
  final bool isSuccess;
  final List<ArticleModel> list;

  const ArticleState({
    this.list = const [],
    this.isLoading = false,
    this.errors = const [],
    this.isSuccess = false,
  });

  copyWith({
    bool isLoading = false,
    List<String> errors = const [],
    bool isSuccess = false,
    List<ArticleModel>? list,
  }) {
    return ArticleState(
      list: list ?? this.list,
      isLoading: isLoading,
      errors: errors,
      isSuccess: isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, errors, isSuccess, list];
}
