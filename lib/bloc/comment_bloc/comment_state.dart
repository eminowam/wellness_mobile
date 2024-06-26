part of 'comment_bloc.dart';

@immutable
class CommentState extends Equatable {
  final bool isLoading;
  final bool isLoadingSend;
  final List<String> errors;
  final bool isSuccess;
  final CommentModel comment;

  const CommentState({
    this.isLoading = false,
    this.isLoadingSend = false,
    this.errors = const [],
    this.isSuccess = false,
    required this.comment,
  });

  copyWith(
      {bool isLoading = false,
      bool isLoadingSend = false,
      List<String> errors = const [],
      CommentModel? comment,
      bool isSuccess = false}) {
    return CommentState(
        isLoading: isLoading,
        isLoadingSend: isLoadingSend,
        errors: errors,
        isSuccess: isSuccess,
        comment: comment ?? this.comment);
  }

  @override
  List<Object?> get props =>
      [isLoading, errors, isSuccess, isLoadingSend, comment];
}
