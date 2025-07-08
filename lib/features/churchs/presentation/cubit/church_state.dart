part of 'church_cubit.dart';

@immutable
sealed class ChurchState {}

final class ChurchInitial extends ChurchState {}

final class ChurchsGetLoading extends ChurchState {}

final class ChurchsGetSuccess extends ChurchState {
  final List<ChurchEntity> Churchs;

  ChurchsGetSuccess(this.Churchs);
}

final class ChurchsGetFailure extends ChurchState {
  final String message;

  ChurchsGetFailure(this.message);
}
