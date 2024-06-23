part of 'comment_bloc.dart';

@immutable


class CommentState extends Equatable {
  final bool isLoading;
  final bool isLoadingSend;
  final List<String> errors;
  final bool isSuccess;
  final CommentModel? comment;

  const CommentState({
    this.isLoading = false,
    this.isLoadingSend = false,
    this.errors = const [],
    this.isSuccess = false,
    this.comment,
  });

  copyWith(
      {bool isLoading = false,
        bool isLoadingSend = false,
        List<String> errors = const [],
        List<CommentModel> comment = const [],
        bool isSuccess = false}) {
    return CommentState(
        isLoading: isLoading,
        isLoadingSend: isLoadingSend,
        errors: errors,
        isSuccess: isSuccess);
  }

  @override
  List<Object?> get props => [isLoading, errors, isSuccess, isLoadingSend,comment];
}
