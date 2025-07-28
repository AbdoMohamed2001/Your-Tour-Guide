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

//-------------------------------------------------------------
final class FavouritesGetLoading extends FavouriteState {}

final class FavouritesGetSuccess extends FavouriteState {
  final List<FavouriteEntity> favList;

  FavouritesGetSuccess(this.favList);
}

final class FavouritesGetFailure extends FavouriteState {
  final String message;

  FavouritesGetFailure(this.message);
}

//-------------------------------------------------------------

class FavouritesGetEntityLoading extends FavouriteState {}

class FavouritesGetEntitySuccess extends FavouriteState {
  final dynamic entity;
  final String collectionName;
  FavouritesGetEntitySuccess(this.entity, this.collectionName);
}

class FavouritesGetEntityError extends FavouriteState {
  final String message;

  FavouritesGetEntityError(this.message);
}

//-------------------------------------------------------------
