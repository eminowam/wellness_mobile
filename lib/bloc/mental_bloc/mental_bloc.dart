import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellness_mobile/data/models/article/mental_model.dart';

import '../../data/errror.dart';
import '../../data/request/mental_repository.dart';

part 'mental_event.dart';

part 'mental_state.dart';

class MentalBloc extends Bloc<MentalEvent, MentalState> {
  final MeditationRepository meditationRepository = MeditationRepository();
  final SharedPreferences preferences;

  MentalBloc(this.preferences) : super(const MentalState()) {
    on<GetAllMeditation>(getAllMeditation);
  }

  getAllMeditation(GetAllMeditation event, emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      var list = await meditationRepository.getMeditation();
      emit(state.copyWith(isSuccess: true, list: list));
    } on DioException catch (e) {
      emit(state.copyWith(errors: getMessageErrors(e)));
    }
  }
}
