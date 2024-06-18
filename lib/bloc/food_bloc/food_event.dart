part of 'food_bloc.dart';

// @immutable
// abstract class FoodEvent {}

@immutable
sealed class FoodEvent extends Equatable {
  const FoodEvent();
}

class GetAllFoods extends FoodEvent {
  @override
  List<Object?> get props => [];
}