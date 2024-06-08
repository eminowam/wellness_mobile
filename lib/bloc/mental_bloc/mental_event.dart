part of 'mental_bloc.dart';

@immutable
sealed class MentalEvent extends Equatable {
  const MentalEvent();
}

class GetAllMeditation extends MentalEvent {
  @override
  List<Object?> get props => [];
}
