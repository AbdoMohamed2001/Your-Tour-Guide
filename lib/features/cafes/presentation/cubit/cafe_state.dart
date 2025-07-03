part of 'cafe_cubit.dart';

@immutable
sealed class CafeState {}

final class CafeInitial extends CafeState {}

final class CafesGetLoading extends CafeState {}

final class CafesGetSuccess extends CafeState {
  final List<CafeEntity> Cafes;

  CafesGetSuccess(this.Cafes);
}

final class CafesGetFailure extends CafeState {
  final String message;

  CafesGetFailure(this.message);
}
