part of 'theme_cubit.dart';

abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ChangeThemeLoading extends ThemeState {}

class ChangeThemeSuccess extends ThemeState {
  final ThemeMode themeMode;
  ChangeThemeSuccess({required this.themeMode});
}

class ChangeThemeFailure extends ThemeState {
  final String message;
  ChangeThemeFailure({required this.message});
}
