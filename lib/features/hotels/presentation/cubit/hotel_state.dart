part of 'hotel_cubit.dart';

@immutable
sealed class HotelState {}

final class HotelInitial extends HotelState {}

final class HotelsGetLoading extends HotelState {}

final class HotelsGetSuccess extends HotelState {
  final List<HotelEntity> hotels;

  HotelsGetSuccess({required this.hotels});
}

final class HotelsGetFailure extends HotelState {
  final String message;

  HotelsGetFailure({required this.message});
}
