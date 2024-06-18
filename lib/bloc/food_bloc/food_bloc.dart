
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellness_mobile/data/models/food/food_model.dart';
import 'package:wellness_mobile/data/request/food_repositoory.dart';

import '../../data/errror.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodsRepository foodsRepository = FoodsRepository();
  final SharedPreferences preferences;

  FoodBloc(this.preferences) : super(const FoodState()) {
    on<GetAllFoods>(getAllFoods);
  }

  getAllFoods(GetAllFoods event, emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      var list = await foodsRepository.getFoods();
      emit(state.copyWith(isSuccess: true, list: list));
    } on DioException catch (e) {
      emit(state.copyWith(errors: getMessageErrors(e)));
    }
  }
}
