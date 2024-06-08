part of 'mental_bloc.dart';


@immutable
class MentalState extends Equatable {
  final bool isLoading;
  final List<String> errors;
  final bool isSuccess;
  final List<MeditationModel> list;

  const MentalState({
    this.list = const [],
    this.isLoading = false,
    this.errors = const [],
    this.isSuccess = false,
  });

  copyWith({
    bool isLoading = false,
    List<String> errors = const [],
    bool isSuccess = false,
    List<MeditationModel>? list,
  }) {
    return MentalState(
      list: list ?? this.list,
      isLoading: isLoading,
      errors: errors,
      isSuccess: isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, errors, isSuccess, list];
}


