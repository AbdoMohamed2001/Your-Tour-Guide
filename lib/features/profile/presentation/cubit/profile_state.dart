part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {}

final class ProfileFailure extends ProfileState {
  final String failMessage;

  ProfileFailure({required this.failMessage});
}

final class ProfileLogoutFailure extends ProfileState {
  final String failMessage;

  ProfileLogoutFailure({required this.failMessage});
}

//
final class ProfileLogoutSuccess extends ProfileState {}

final class ProfileLogoutLoading extends ProfileState {}
