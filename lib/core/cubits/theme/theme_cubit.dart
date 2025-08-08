import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/cacheHelper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool? _isDarkModeActive;

  bool? get isDarkModeActive => _isDarkModeActive;
  bool isDarkMode(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return true;
    }
    return false;
  }

  ThemeMode get currentThemeMode {
    if (_isDarkModeActive == null) {
      return ThemeMode.system; // Default to system theme
    }
    return _isDarkModeActive! ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> getSavedTheme() async {
    try {
      final cachedTheme = CacheHelper.getCachedTheme();
      if (cachedTheme != null) {
        _isDarkModeActive = cachedTheme;
      }
      emit(ChangeThemeSuccess());
    } catch (e) {
      log('Error loading saved theme: ${e.toString()}');
      _isDarkModeActive = null;
      emit(ChangeThemeFailure(
          message: 'Error loading saved theme: ${e.toString()}'));
    }
  }

  Future<void> toggleTheme() async {
    try {
      // Get current system brightness to toggle from system mode
      if (_isDarkModeActive == null) {
        // If currently on system mode, determine what to toggle to
        // You might want to get system brightness here
        _isDarkModeActive = false; // Default to light when toggling from system
      } else {
        _isDarkModeActive = !_isDarkModeActive!;
      }

      await CacheHelper.cacheTheme(_isDarkModeActive!);
      emit(ChangeThemeSuccess());
    } catch (e) {
      log('Error toggling theme: ${e.toString()}');
      // Revert the change if caching fails
      if (_isDarkModeActive != null) {
        _isDarkModeActive = !_isDarkModeActive!;
      }
    }
  }

  // Method to reset to system theme
  Future<void> resetToSystemTheme() async {
    try {
      _isDarkModeActive = null;
      await CacheHelper.clearCachedTheme(); // You'll need to implement this
      emit(ChangeThemeSuccess());
    } catch (e) {
      log('Error resetting to system theme: ${e.toString()}');
      emit(ChangeThemeFailure(
          message: 'Error resetting to system theme: ${e.toString()}'));
    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    try {
      switch (themeMode) {
        case ThemeMode.system:
          _isDarkModeActive = null;
          await CacheHelper.clearCachedTheme();
          break;
        case ThemeMode.dark:
          _isDarkModeActive = true;
          await CacheHelper.cacheTheme(true);
          break;
        case ThemeMode.light:
          _isDarkModeActive = false;
          await CacheHelper.cacheTheme(false);
          break;
      }
      emit(ChangeThemeSuccess());
    } catch (e) {
      log('Error setting theme mode: ${e.toString()}');
      emit(ChangeThemeFailure(
          message: 'Error setting theme mode: ${e.toString()}'));
    }
  }
}
