part of 'cinema_cubit.dart';

@immutable
sealed class CinemaState {}

final class CinemaInitial extends CinemaState {}

final class CinemasGetLoading extends CinemaState {}

final class CinemasGetSuccess extends CinemaState {
  final List<CinemaEntity> Cinemas;

  CinemasGetSuccess(this.Cinemas);
}

final class CinemasGetFailure extends CinemaState {
  final String message;

  CinemasGetFailure(this.message);
}
