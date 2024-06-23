part of 'comment_bloc.dart';



@immutable
abstract class CommentEvent extends Equatable {}

class CommentCreateEvent extends CommentEvent {
  final CommentModel comment;

  CommentCreateEvent({required this.comment});

  @override
  List<Object?> get props => [comment];
}
