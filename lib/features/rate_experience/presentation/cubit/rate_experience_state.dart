part of 'rate_experience_cubit.dart';

abstract class RateExperienceState extends Equatable {
  const RateExperienceState();

  @override
  List<Object> get props => [];
}

class RateExperienceInitial extends RateExperienceState {}

class RateExperienceLoading extends RateExperienceState {}

class RateExperienceLoaded extends RateExperienceState {
  final OrderedFood orderedFood;

  const RateExperienceLoaded(this.orderedFood);

  @override
  List<Object> get props => [orderedFood];
}

class RateExperienceError extends RateExperienceState {
  final String message;

  const RateExperienceError(this.message);

  @override
  List<Object> get props => [message];
}

abstract class UserRatingState extends Equatable {
  const UserRatingState();

  @override
  List<Object> get props => [];
}

class UserRatingInitial extends UserRatingState {}

class UserRatingLoading extends UserRatingState {}

class UserRatingLoaded extends UserRatingState {
  final UserRating userRating;

  const UserRatingLoaded(this.userRating);

  @override
  List<Object> get props => [userRating];
}

class UserRatingError extends UserRatingState {
  final String message;

  const UserRatingError(this.message);

  @override
  List<Object> get props => [message];
}
