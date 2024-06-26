import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellness_mobile/data/models/comment/comment.dart';
import 'package:wellness_mobile/data/request/comment_repository.dart';

import '../../data/errror.dart';

part 'comment_event.dart';

part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository = CommentRepository();
  final SharedPreferences preferences;

  CommentBloc(this.preferences) : super( CommentState(comment: CommentModel())) {
    on<CommentCreateEvent>(onCommentCreate);
  }

  onCommentCreate(CommentCreateEvent event, emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await commentRepository.createComment(event.comment);
      emit(state.copyWith(isSuccess: true));
    } on DioException catch (e) {
      emit(state.copyWith(errors: getMessageErrors(e)));
    }
  }
}
