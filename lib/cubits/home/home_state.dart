part of 'home_cubit.dart';

@immutable
abstract class HomeState {
}

class HomeInitial extends HomeState {}
class HomeChangeIndexState extends HomeState {}
class HomeChangeCollectionName extends HomeState {}
class HomeUpdateUi extends HomeState {}
class HomeChangeTheme extends HomeState {}
class HomeFacebookSignOut extends HomeState {}
class HomeEmailSignOut extends HomeState {}
class HomeGoogleSignOut extends HomeState {}
class ChangeLocaleState extends HomeState {
   final Locale locale;
  ChangeLocaleState({required this.locale});
}
