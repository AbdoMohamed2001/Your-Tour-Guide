part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {
}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {}
class AuthFailure extends AuthState {
  String errMessage;
  AuthFailure({required this.errMessage});
}
class AuthMakeDefaultImage extends AuthState {}
class AuthMakeDefaultImageBundle extends AuthState {}
class AuthSelectImage extends AuthState {}
class AuthChangeObscure extends AuthState {}
class AuthFacebookSignOut extends AuthState {}
