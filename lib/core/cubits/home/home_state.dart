part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeIndexState extends HomeState {}

//PLACES
//----------------------------------------------------------
class HomeGetFeaturedPlacesLoading extends HomeState {}

class HomeGetFeaturedPlacesSuccess extends HomeState {
  final List<PlaceEntity> places;
  HomeGetFeaturedPlacesSuccess({required this.places});
}

class HomeGetFeaturedPlacesFailure extends HomeState {
  final String message;
  HomeGetFeaturedPlacesFailure({required this.message});
}
