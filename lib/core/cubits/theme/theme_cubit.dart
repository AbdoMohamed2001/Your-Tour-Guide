import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/cacheHelper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeMode get currentThemeMode =>
      _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Future<void> getSavedTheme() async {
    try {
      _isDarkMode = CacheHelper.getCachedTheme();
      emit(ChangeThemeSuccess());
    } catch (e) {
      log('Error loading saved theme: ${e.toString()}');
      _isDarkMode = false;
      emit(ChangeThemeFailure(
          message: 'Error loading saved theme: ${e.toString()}'));
    }
  }

  Future<void> toggleTheme() async {
    try {
      _isDarkMode = !_isDarkMode;
      await CacheHelper.cacheTheme(_isDarkMode);
      emit(ChangeThemeSuccess());
    } catch (e) {
      log('Error toggling theme: ${e.toString()}');
      // Revert the change if caching fails
      _isDarkMode = !_isDarkMode;
    }
  }
}
