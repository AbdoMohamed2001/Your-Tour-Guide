part of 'place_cubit.dart';

@immutable
abstract class PlaceState {}

class PlaceInitial                    extends PlaceState {}
class PlaceChangeState                extends PlaceState {}
class PlaceRestorePersistedPref       extends PlaceState {}
class PlaceChangeLiked                extends PlaceState {}
class PlaceChangeIconColor            extends PlaceState {}
class PlaceAddedToFavouriteLoading    extends PlaceState {}
class PlaceAddedToFavouriteSuccess    extends PlaceState {}
class PlaceAddedToFavouriteFailure    extends PlaceState {
  final String errMessage;

  PlaceAddedToFavouriteFailure(this.errMessage);
}
class PlaceDeleteFromFavouriteLoading extends PlaceState {}
class PlaceDeleteFromFavouriteSuccess extends PlaceState {}
class PlaceMakePhoneCallState extends PlaceState {}
class PlaceDeleteFromFavouriteFailure extends PlaceState {
  final String errMessage;

  PlaceDeleteFromFavouriteFailure(this.errMessage);
}
class HotelChangeOrder extends PlaceState {}
class HotelChangeOrderBy extends PlaceState {}

