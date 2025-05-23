part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeIndexState extends HomeState {}

class HomeChangeCollectionName extends HomeState {}

class HomeUpdateUi extends HomeState {}

class HomeChangeTheme extends HomeState {}

class HomeFacebookSignOut extends HomeState {}

class HomeEmailSignOut extends HomeState {}

class HomeGoogleSignOut extends HomeState {}

class ChangeLocaleState extends HomeState {
  final Locale locale;
  ChangeLocaleState({required this.locale});
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
