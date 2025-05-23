import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());
  static LocaleCubit get(context) => BlocProvider.of(context);
  // ThemeMode themeMode = ThemeMode.dark;
  // bool isDark = false;
  // Color iconColor = Colors.red;
  //
  // void getSavedLanguage() {
  //   final cachedLanguageCode = CacheData.getCachedLanguage();
  //   emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  // }
  // Future<void> changeLanguage(String languageCode) async {
  //   await CacheData.cacheLanguage(languageCode);
  //   iconColor = Colors.cyan;
  //   emit(ChangeLocaleState(locale: Locale(languageCode)));
  //   print('this is lang code : $languageCode');
  //
  // }
  //
  // void changeAppMode() {
  //   print('old $isDark');
  //   isDark = !isDark;
  //   print('new $isDark');
  //   emit(LocaleChangeTheme());
  // }
}
