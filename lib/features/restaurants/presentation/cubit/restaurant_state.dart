part of 'restaurant_cubit.dart';

@immutable
sealed class RestaurantState {}

final class RestaurantInitial extends RestaurantState {}

final class RestaurantsGetLoading extends RestaurantState {}

final class RestaurantsGetSuccess extends RestaurantState {
  final List<RestaurantEntity> restaurants;

  RestaurantsGetSuccess(this.restaurants);
}

final class RestaurantsGetFailure extends RestaurantState {
  final String message;

  RestaurantsGetFailure(this.message);
}
