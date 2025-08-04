import 'dart:developer';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/cacheHelper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());
  Locale _currentLocale = const Locale('en');
  Locale get currentLocale => _currentLocale;

  Future<void> getSavedLanguage() async {
    emit(ChangeLocaleLoading());
    try {
      final cachedLanguageCode = CacheHelper.getCachedLanguage();
      _currentLocale = Locale(cachedLanguageCode);
      emit(ChangeLocaleSuccess(locale: Locale(cachedLanguageCode)));
    } catch (e) {
      log('Error while trying to get local language ${e.toString()}');
      emit(ChangeLocaleFailure(
          message: 'Error while trying to get local language'));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    if (_currentLocale.languageCode == languageCode) return;
    emit(ChangeLocaleLoading());
    try {
      await CacheHelper.cacheLanguage(languageCode);
      await Future.delayed(const Duration(milliseconds: 300));
      _currentLocale = Locale(languageCode);
      emit(ChangeLocaleSuccess(locale: Locale(languageCode)));
    } catch (e) {
      log('Error changing language ${e.toString()}');
      emit(ChangeLocaleFailure(
          message: 'Error while trying to change local language'));
    }
  }
}
