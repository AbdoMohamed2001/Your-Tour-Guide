part of 'locale_cubit.dart';

abstract class LocaleState {}

class LocaleInitial extends LocaleState {}

class ChangeLocaleLoading extends LocaleState {}

class ChangeLocaleSuccess extends LocaleState {
  final Locale locale;
  ChangeLocaleSuccess({required this.locale});
}

class ChangeLocaleFailure extends LocaleState {
  final String message;
  ChangeLocaleFailure({required this.message});
}
