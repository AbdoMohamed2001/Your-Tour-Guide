part of 'mosque_cubit.dart';

@immutable
sealed class MosqueState {}

final class MosqueInitial extends MosqueState {}

final class MosquesGetLoading extends MosqueState {}

final class MosquesGetSuccess extends MosqueState {
  final List<MosqueEntity> Mosques;

  MosquesGetSuccess(this.Mosques);
}

final class MosquesGetFailure extends MosqueState {
  final String message;

  MosquesGetFailure(this.message);
}
