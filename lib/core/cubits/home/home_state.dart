part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeIndexState extends HomeState {}

class HomeChangeTheme extends HomeState {}

class ChangeLocaleLoading extends HomeState {}

class ChangeLocaleSuccess extends HomeState {
  final Locale locale;
  ChangeLocaleSuccess({required this.locale});
}

class ChangeLocaleFailure extends HomeState {
  final String message;
  ChangeLocaleFailure({required this.message});
}

class HomeGetFeaturedPlacesSuccess extends HomeState {
  final List<PlaceEntity> places;
  HomeGetFeaturedPlacesSuccess({required this.places});
}

class HomeGetFeaturedPlacesLoading extends HomeState {}

class HomeGetFeaturedPlacesFailure extends HomeState {
  final String message;
  HomeGetFeaturedPlacesFailure({required this.message});
}
