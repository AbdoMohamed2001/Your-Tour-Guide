part of 'city_cubit.dart';

@immutable
abstract class CityState {}

class CityInitial extends CityState {}

class CityGetLoading extends CityState {}

class CityGetSuccess extends CityState {
  final List<CityEntity> cities;

  CityGetSuccess(this.cities);
}

class CityGetFailure extends CityState {
  final String error;

  CityGetFailure(this.error);
}
