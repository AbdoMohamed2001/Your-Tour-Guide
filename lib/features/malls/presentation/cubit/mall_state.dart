part of 'mall_cubit.dart';

@immutable
sealed class MallState {}

final class MallInitial extends MallState {}

final class MallsGetLoading extends MallState {}

final class MallsGetSuccess extends MallState {
  final List<MallEntity> Malls;

  MallsGetSuccess(this.Malls);
}

final class MallsGetFailure extends MallState {
  final String message;

  MallsGetFailure(this.message);
}
