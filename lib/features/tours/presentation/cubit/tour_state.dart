part of 'tour_cubit.dart';

@immutable
sealed class TourState {}

final class TourInitial extends TourState {}

final class TourLoading extends TourState {}

final class TourSuccess extends TourState {
  final List<TourEntity> tours;

  TourSuccess(this.tours);
}

final class TourFailure extends TourState {
  final String message;

  TourFailure(this.message);
}
