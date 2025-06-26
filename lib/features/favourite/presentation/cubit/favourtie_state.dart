part of 'favourtie_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteToggleLoading extends FavouriteState {}

final class FavouriteToggleSuccess extends FavouriteState {
  final Set<String> favourites;

  FavouriteToggleSuccess(this.favourites);
}

final class FavouriteToggleFailure extends FavouriteState {
  final String message;

  FavouriteToggleFailure(this.message);
}
