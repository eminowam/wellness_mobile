part of 'food_bloc.dart';

@immutable
class FoodState extends Equatable {
  final bool isLoading;
  final List<String> errors;
  final bool isSuccess;
  final List<FoodModel> list;

  const FoodState({
    this.list = const [],
    this.isLoading = false,
    this.errors = const [],
    this.isSuccess = false,
  });

  copyWith({
    bool isLoading = false,
    List<String> errors = const [],
    bool isSuccess = false,
    List<FoodModel>? list,
  }) {
    return FoodState(
      list: list ?? this.list,
      isLoading: isLoading,
      errors: errors,
      isSuccess: isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, errors, isSuccess, list];
}


